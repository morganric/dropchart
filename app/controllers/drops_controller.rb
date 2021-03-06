class DropsController < ApplicationController
  before_action :set_drop, only: [:show, :edit, :update, :destroy, :plays, :embed]
   before_action :authenticate_user!, :except => [:show,  :index]

   skip_before_filter  :verify_authenticity_token
  after_filter :allow_iframe

  # GET /drops
  # GET /drops.json
  def index
    @drops = Drop.all.order('plays DESC').page params[:page]
    @tags = ActsAsTaggableOn::Tag.most_used(10)
    @featured = Drop.where(:featured => true).order('plays DESC').page params[:page]
  end

  def featured
    @drops = Drop.where(:featured => true).order('created_at DESC').page params[:page]
    
  end


  def artist
    @drops = Drop.where(:artist => params[:artist])
    @artist = params[:artist]
  end

  def label
    @drops = Drop.where(:label => params[:label])
    @label = params[:label]
  end



  def tag
    @drops = Drop.tagged_with(params[:tag])
    @tag = params[:tag]
  end


  # GET /drops/1
  # GET /drops/1.json
  def show
    
  end

  def embed
    render layout: 'embed'
  end

  def plays

    @drop.plays = @drop.plays.to_i + 1
    @drop.save

    respond_to do |format|
     if @drop.save
       format.json { render :show, status: :ok, location: @drop }
     else
       format.html { render action: 'new' }
       format.json { render json: @drop.errors, status: :unprocessable_entity }
     end
   end

  end

  # GET /drops/new
  def new
    @drop = Drop.new
  end

  # GET /drops/1/edit
  def edit
    authorize @drop
  end

  # POST /drops
  # POST /drops.json
  def create
    @drop = Drop.new(drop_params)
    @drop.user_id = current_user.id
    @drop.slug = @drop.track.parameterize

    respond_to do |format|
      if @drop.save
        format.html { redirect_to user_drop_path(:user_id => @drop.user.name, id: @drop.slug), notice: 'Drop was successfully created.' }
        format.json { render :show, status: :created, location: @drop }
      else
        format.html { render :new }
        format.json { render json: @drop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /drops/1
  # PATCH/PUT /drops/1.json
  def update
    respond_to do |format|
      if @drop.update(drop_params)
        format.html { redirect_to @drop, notice: 'Drop was successfully updated.' }
        format.json { render :show, status: :ok, location: @drop }
      else
        format.html { render :edit }
        format.json { render json: @drop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drops/1
  # DELETE /drops/1.json
  def destroy
    @drop.destroy
    respond_to do |format|
      format.html { redirect_to drops_url, notice: 'Drop was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_drop
      @drop = Drop.friendly.find(params[:id])
    end

    
  def allow_iframe
    response.headers['X-Frame-Options'] = "ALLOWALL"
  end

    
    # Never trust parameters from the scary internet, only allow the white list through.
    def drop_params
      params.require(:drop).permit(:audio, :clip, :cover, :release_date, :url, :user_id, :slug, :tag_list, 
                    :start, :artist, :track, :label, :album, :credits, :plays, :featured)
    end
end

class CrawlListsController < ApplicationController
  before_action :set_crawl_list, only: [:show, :edit, :update, :destroy]
  before_action :set_post

  # GET /crawl_lists
  # GET /crawl_lists.json
  def index
    @crawl_lists = @post.present? ? @post.crawl_lists.all : CrawlList.all
  end

  # GET /crawl_lists/1
  # GET /crawl_lists/1.json
  def show
  end

  # GET /crawl_lists/new
  def new
    @crawl_list = @post.present? ? @post.crawl_lists.new : CrawlList.new
  end

  # GET /crawl_lists/1/edit
  def edit
  end

  # POST /crawl_lists
  # POST /crawl_lists.json
  def create
    @crawl_list = @post.present? ? @post.crawl_lists.new(crawl_list_params) : CrawlList.new(crawl_list_params)

    respond_to do |format|
      if @crawl_list.save
        format.html { redirect_to (@post.present? ? [@crawl_list.post, @crawl_list] : @crawl_list), notice: '게시글이 작성되었습니다.' }
        format.json { render :show, status: :created, location: @crawl_list }
      else
        format.html { render :new }
        format.json { render json: @crawl_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /crawl_lists/1
  # PATCH/PUT /crawl_lists/1.json
  def update
    respond_to do |format|
      if @crawl_list.update(crawl_list_params)
        format.html { redirect_to (@post.present? ? [@crawl_list.post, @crawl_list] : @crawl_list), notice: '게시글이 수정되었습니다.' }
        format.json { render :show, status: :ok, location: @crawl_list }
      else
        format.html { render :edit }
        format.json { render json: @crawl_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /crawl_lists/1
  # DELETE /crawl_lists/1.json
  def destroy
    @crawl_list.destroy
    respond_to do |format|
      format.html { redirect_to post_crawl_lists_path(@crawl_list.post.id), notice: '게시글이 성공적으로 제거되었습니다.' }
      format.json { head :no_content }
    end
  end

  private
    def set_post
      @post = Post.find(params[:post_id]) if params[:post_id].present?
    end
  
    # Use callbacks to share common setup or constraints between actions.
    def set_crawl_list
      @crawl_list = CrawlList.find(params[:id])
      
      if @post.present?
        @crawl_list = @post.crawl_lists.find(params[:id])
      end
      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def crawl_list_params
      params.require(:crawl_list).permit(:title, :is_message_send)
    end
end

class ThreadController < ApplicationController
  before_action :authorized, only: [:create_form]

  TOPICS_PER_PAGE = 5

  def index
    @page = params.fetch(:page, 0).to_i
    condition = {}
    category = params.fetch(:category, nil)
    order_by = params.fetch(:order_by, :created_at)
    dir = params.fetch(:dir, :desc)
  
  
    @topics = Topic.left_joins(:user).left_joins(:thread_category)
                      .select("users.id as user_id, users.name AS 'author', title, description, threads.created_at as created_at, threads.id AS id, thread_category.name as category,thread_category.id as category_id")
                      .where(condition)
                      .offset(@page * TOPICS_PER_PAGE)
                      .limit(TOPICS_PER_PAGE)
                      .sanitized_order(order_by, dir)

                     
    @data = @topics.map(&:attributes)
    @total = Post.count
    @pages_count = @total / TOPICS_PER_PAGE
  end

  def read
    @topic = Topic.get_with_join(params[:id])
     @messages = Message.get_with_join(params[:id]).map(&:attributes)
    # @data = @topic.map(&:attributes)
  end

  def create
    params = topic_params
    params[:user_id] = session[:user_id]
    @topic = Topic.create(params)
    if @topic.valid?
      @topic.save
      redirect_to controller: 'thread', action: 'read', id: @topic.id
    else 
      render :create_form
    end
  end

  def comment
    message = params.permit(:message)
    message[:user_id] = session[:user_id]
    message[:thread_id] = params[:id]
    @msg = Message.create(message)
    if @msg.valid?
      @msg.save
      redirect_back(fallback_location: '/')
    else 
      flash[:error] = @msg.errors.full_messages
      redirect_back(fallback_location: '/')
    end
  end

  def create_form
    @topic = Topic.new
    @categories = ThreadCategory.all
  end

  def topic_params
    params.permit(:title, :description, :category_id)
  end

  
end

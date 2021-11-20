module Admin
  class TopicsController < Admin::BaseController
    before_action :topic, only: [:edit, :update, :destroy]
    before_action :package_name, only: [:new, :edit, :create, :update]

    def index
      @package_name = "admin/topics/index"

      topics = Topic.all
      @pagy, @topics = pagy(topics)
    end

    def new
      @topic = Topic.new
    end

    def create
      @topic = Topic.new(topic_params)
      if @topic.save
        flash[:success] = t("flash.created")
        redirect_to admin_topics_path
      else
        flash.now[:danger] = t("flash.created_false")
        render :new
      end
    end

    def edit; end

    def update
      if @topic.update(topic_params)
        flash[:success] = t("flash.updated")
        redirect_to admin_topics_path
      else
        flash.now[:danger] = t("flash.updated_false")
        render :edit
      end
    end

    def destroy
      topic.articles.update_all(topic_id: nil) # rubocop:disable Rails/SkipsModelValidations

      if topic.destroy
        flash[:info] = t("flash.destroyed")
      else
        flash[:danger] = t("flash.destroyed_false")
      end

      head :ok
    end

    private

    def package_name
      @package_name ||= "admin/topics/create"
    end

    def topic_params
      params.require(:topic).permit(:name, :category_id, :description)
    end

    def topic
      @topic ||= Topic.friendly.find(params[:id])
    end
  end
end

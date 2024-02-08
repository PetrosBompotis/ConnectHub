class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def hobby
    posts_for_branch(params[:action])
  end

  def study
    posts_for_branch(params[:action])
  end

  def team
    posts_for_branch(params[:action])
  end

  private

  def posts_for_branch(branch)
    @categories = Category.where(branch: branch)
    @posts = get_posts.paginate(page: params[:page])

    respond_to do |format|
      format.html { render layout: !request.xhr? }
      format.js { render partial: 'posts/posts_pagination_page' }
    end
  end

  def get_posts
    branch = params[:action]
    search = params[:search]
    category = params[:category]

    per_page = 50 # or any number you desire

    if category.blank? && search.blank?
      posts = Post.by_branch(branch).paginate(page: params[:page], per_page: per_page)
    elsif category.blank? && search.present?
      posts = Post.by_branch(branch).search(search).paginate(page: params[:page], per_page: per_page)
    elsif category.present? && search.blank?
      posts = Post.by_category(branch, category).paginate(page: params[:page], per_page: per_page)
    elsif category.present? && search.present?
      posts = Post.by_category(branch, category).search(search).paginate(page: params[:page], per_page: per_page)
    else
      posts = []
    end
  end

end

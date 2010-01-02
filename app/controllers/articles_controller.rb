class ArticlesController < ApplicationController
  # GET /articles
  # GET /articles.xml
  before_filter :check_login,:except=>[:index,:home_index,:feed]
  
  def index
    @articles=Article.paginate_by_author_id session[:user_id],:page=>params[:page]||1,:per_page=>3
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @articles }
    end
  end



  # GET /articles/1
  # GET /articles/1.xml
  def show
    @article = Article.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @article }
    end
  end

  # GET /articles/new
  # GET /articles/new.xml
  def new
    @article = Article.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @article }
    end
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
  end

  # POST /articles
  # POST /articles.xml
  def create
    author=User.find(session[:user_id])
#    @article = Article.new(params[:article])
   @article=author.articles.build(params[:article])
    respond_to do |format|
      if @article.save
        flash[:notice] = 'Article was successfully created.'
        format.html { 
          redirect_to_remembered_url
          }
        format.xml  { render :xml => @article, :status => :created, :location => @article }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.xml
  def update
    @article = Article.find(params[:id])
    respond_to do |format|
      if @article.update_attributes(params[:article])
        flash[:notice] = 'Article was successfully updated.'
        format.html { redirect_to_remembered_url}
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.xml
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    respond_to do |format|
      format.html { redirect_to_remembered_url}
      format.xml  { head :ok }
    end
  end
#---------------non-resource actions
def toggle
  article=Article.find(params[:id])
  puts "-------------------toggleing"
  p article.state
  if article.state=="deactive" then
    article.update_attribute("state", "active")
    p "updated to active"
 
  elsif article.state=="active" then
    article.update_attribute("state", "deactive")
    p "updated to deactive"
  end 
  render :text=>article.state

#  respond_to do |format|
#    format.html { redirect_to :back}
#    format.ajax  { render :text=>article.state }
#  end
  
end

def feed
  author_id=params[:id];
  @articles=Article.find_all_by_author_id(author_id,:order=>"created_at DESC",:limit=>10)
  @author=User.find(author_id)
#  render :text=>articles.length
end

  
end

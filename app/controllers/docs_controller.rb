class DocsController < ApplicationController
  before_action :find_doc, only: [:show, :edit, :update, :destroy]

  def index
    @docs = Doc.where(user_id: current_user)
  end

  def show
  end

  def new
    @doc = current_user.docs.new #buil and new is same
  end

  def create
    @doc = current_user.docs.new(doc_params)

    if @doc.save
      redirect_to @doc
    else
      render :new  #It will not create new page
    end
  end

  def edit

  end

  def update
    if @doc.update(doc_params)
      redirect_to @doc
    else
      render :edit
    end
  end

  def destroy
    @doc.destroy
    redirect_to docs_path
  end

  private

    def find_doc
      @doc = Doc.find(params[:id])
    end

    def doc_params
      params.require(:doc).permit(:title, :content)
    end
end

class ListsController < ApplicationController
    def index
      @lists = List.all
    end

    def new
      @list = List.new
    end

    def create
        @list = List.new(params_list)
        if @list.save
            redirect_to lists_path, notice:"新增成功"
        else
            render :new
        end
    end

    def edit
      @list = List.find_by(id: params[:id])
    end
    def update
      @list = List.find_by(id: params[:id])
      if @list.update(params_list)
        redirect_to lists_path, notice: "修改成功"  
    else
        render :edit
      end

    end

    def destroy
      @list = List.find_by(id:params[:id])
      @list.destroy if @list
      redirect_to lists_path, notice: "刪除成功"
    end


    private
    def params_list
      params.require(:list).permit(:item, :calories, :price)
    end
end

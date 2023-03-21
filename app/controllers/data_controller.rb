class DataController < ApplicationController
  def new
   @datum = Datum.new()
  end

  #def create
   # @datum = Datum.new(datum_params)
  #  PostMailer.post_created.deliver_now
   # if @datum.save
    #  @message = @datum
    #  PostMailer.post_created.deliver_now
    #  session[:datum_id] = @datum.id
     # redirect_to root_path, notice: "Your plan was saved!"
   # else
    #  render :new
   # end
   # end

  def create
    @datum = Datum.new(datum_params)
    if @datum.save
      @user = User.find(session[:user_id])
      @mail = @user.email
      PostMailer.post_created(@datum,@mail).deliver_now
      session[:datum_id] = @datum.id
      redirect_to root_path, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

    


  def show
    if session[:datum_id]
      l4 = session[:datum_id]
      @datum = Datum.where(id: l4)
    else
      redirect_to root_path
    end
  end

  private

  def datum_params
    params.require(:datum).permit(:plan)
  end
end
class VotesController < ApplicationController
  def create
    @vote = current_user.votes.new(article_id: params[:article_id])

    if @vote.save
      redirect_to request.referer, notice: 'You voted an article.'
    else
      redirect_to request.referer, alert: 'You cannot vote this article.'
    end
  end

  def destroy
    vote = Vote.find_by(id: params[:id], user: current_user, article_id: params[:article_id])
    if vote
      vote.destroy
      redirect_to request.referer, notice: 'You unvoted this article.'
    else
      redirect_to request.referer, alert: 'You cannot unvoted article that you did not like before.'
    end
  end
end

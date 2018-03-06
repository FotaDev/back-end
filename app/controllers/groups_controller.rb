class GroupsController < ApplicationController
  respond_to :json

  def index
    @group = Group.all
    respond_with(@group)
  end
end

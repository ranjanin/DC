class FamilyMembersController < ApplicationController
  
  
  def index
    @family_members = current_user.family_members.paginate(:page => params[:page], :per_page => 25).order('created_at DESC')
  end
  
  def new
    @family_member = FamilyMember.new
  end
  
  def create
    @family_member = FamilyMember.new(set_params)
    @family_member.user_id = current_user.id
    if @family_member.save
      redirect_to family_members_path
    end      
  end
  
  
  def show
    @family_member = FamilyMember.find(params[:id])
  end
  
  def edit
    @family_member = FamilyMember.find(params[:id])
  end
  
  
  def update
    @family_member = FamilyMember.find(params[:id])
    if @family_member.update_attributes(set_params)
      redirect_to family_member_path(@family_member.id)
    end
  end
  
  def destroy
  end
  
  private
  
  def set_params
    params[:family_member].permit(:relation, :first_name, :last_name, :date_of_birth, :blood_group, :height, :weight, :known_ailments, :user_id)
  end
  
end

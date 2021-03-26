class PatientsController < ApplicationController
  def index
    @patients = Patient.order('last_name ASC')
  end

  def show
    @patient = Patient.find(params[:id])
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to(patients_path, notice: "Added Patient")
    else
      render('new')
    end

  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])
    if @patient.update(patient_params)
      redirect_to(patients_path, notice: "Updated Patient")
    else
      render('edit')
    end

  end

  def delete
    @patient = Patient.find(params[:id])
  end

  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy
    redirect_to(patients_path, notice: "Deleted Patient")
  end

  private

  def patient_params
    params.require(:patient).permit(
      :first_name,
      :last_name,
      :dob,
      :address,
      :phone_number,
      :age,
      :vaccine_type,
      :state,
      :city,
      :gender
    )
  end


end

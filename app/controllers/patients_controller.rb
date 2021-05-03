class PatientsController < ApplicationController
  require 'json'

  #list all patients in the index page
  def index
    @patients = Patient.order('last_name ASC')
    @id = Patient.maximum(:id)
    if(@id != nil)
      @patient = Patient.find(@id)
      File.open("public/patient_info.json", "w"){ |f| f << @patient.to_json}
    end
  end

  #patient to be shown in the show page
  def show
    @patient = Patient.find(params[:id])
  end

  #route to create new patient
  def new
    @patient = Patient.new
  end

  #create a new patient
  def create
    @patient = Patient.new(patient_params)
    # @patient.image_url = url_for(@patient.avatar)
    if @patient.save
      redirect_to(patients_path, notice: "Added Patient")
    else
      render('new')
    end

  end

  #route to edit patient information
  def edit
    @patient = Patient.find(params[:id])
  end

  #find and update existing patient data
  def update
    @patient = Patient.find(params[:id])
    @patient.avatar.attach(params[:avatar])
    # @patient.image_url = url_for(@patient.avatar)
    if @patient.update(patient_params)
      redirect_to(patients_path, notice: "Updated Patient")
    else
      render('edit')
    end

  end

  #route to delete patient information
  def delete
    @patient = Patient.find(params[:id])
  end

  #find and delete existing patient data
  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy
    redirect_to(patients_path, notice: "Deleted Patient")
  end

  #generate QR Code for selected patient
  def qr_code
    @patient = Patient.find(params[:id])
    @record_url = vacc_rec_patient_url(@patient)
    @qr = RQRCode::QRCode.new(@record_url, size: 10, level: :h)
    @png = @qr.as_png(
      bit_depth: 1,
      border_modules: 4,
      color_mode: ChunkyPNG::COLOR_GRAYSCALE,
      color: 'black',
      file: nil,
      fill: 'white',
      module_px_size: 6,
      resize_exactly_to: false,
      resize_gte_to: false,
      size: 400
    )
  end

  #patient shown in current vaccination record
  def vacc_rec
    @patient = Patient.find(params[:id])
  end

  private

  #parameters a patient possesses
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
      :gender,
      :avatar
    )
  end


end

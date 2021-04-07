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

  def vacc_rec
    @patient = Patient.find(params[:id])
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

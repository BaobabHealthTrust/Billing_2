class InsuranceController < ApplicationController
  def index

    insurances = HealthInsurance.joins("LEFT JOIN  health_insurance_plans p USING(insurance_id)") \
      .select("p.name plan, p.cover_percentage, health_insurances.name name,
      health_insurances.description insurance_description, p.description plan_description,
      p.insurance_plan_id plan_id, health_insurances.insurance_id ins_id")

    @insurances = {}

    (insurances || []).each do |insurance|
      @insurances[insurance.name] = {
          plans: [], insurance_description: insurance.insurance_description,
          insurance_id: insurance.ins_id
      } if @insurances[insurance.name].blank?

      @insurances[insurance.name][:plans] << {
          name: insurance.plan, cover_percentage: insurance.cover_percentage,
          plan_id: insurance.plan_id
      } unless insurance.plan_id.blank?

    end

  end

  def update_insurance
    @health_insurance = HealthInsurance.find(params[:insurance_id]) rescue nil
    if request.post?
      if @health_insurance.blank?
        @health_insurance = HealthInsurance.create(name: params[:name], creator: 1)
        # don't forget to remove creator hardcode
      else
        @health_insurance.update_attributes(name: params[:name])
      end
      @health_insurance.update_attributes(description: params[:description]) unless params[:description].blank?
      redirect_to '/insurance' and return
    end
  end

  def new_company
    @insurance = HealthInsurance.find(params[:insurance_id]) rescue nil
  end

  def add_insurance_plan
    @insurance = HealthInsurance.find(params[:insurance_id])

    if request.post?
      insurance = HealthInsurancePlan.create(name: params[:name],
                                             insurance_id: @insurance.id, description: params[:description],
                                             cover_percentage: params[:cover])
      redirect_to '/insurances' and return
    end
  end

  def edit_insurance_plan
    if request.post?
      insurance = HealthInsurancePlan.find(params[:insurance_plan_id]) \
        .update_attributes(name: params[:name], description: params[:description],
                           cover_percentage: params[:cover])
      redirect_to '/insurances' and return
    end
    @insurance_plan = HealthInsurancePlan.find(params[:insurance_plan_id])
  end
end

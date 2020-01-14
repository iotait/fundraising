class SuccessfulCharge
  def call(event)
    donation = Donation.where(session_id: event.data.object.id)
    donation.status = "completed"
    donation.save
  end
end

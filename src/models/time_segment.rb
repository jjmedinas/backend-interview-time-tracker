class TimeSegment < ActiveRecord::Base
  belongs_to :project

  def initialize(params)
    @errors = ActiveModel::Errors.new(self)
    super(params)
  end

  def start!
    update!(started_at: Time.now) and return if valid_to_start?

    raise(StandardError, @errors.full_messages)
  end

  def stop!
    update(stopped_at: Time.now) and return if valid_to_start?

    raise Exception.new @errors.full_messages
  end

  def valid_to_start?
    return false if has_already_started? || has_already_stopped?

    true
  end

  def valid_to_stop?
    return false if has_already_stopped? || has_not_started?

    true
  end

  private

  def has_already_started?
    return false if started_at.nil?
    
    @errors.add(:base, "The time segment was already started")
    true
  end

  def has_already_stopped?
    return false if stopped_at.nil?
    
    @errors.add(:base, message: "The time segment was already stopped")
    true
  end

  def has_not_started?
    return false if started_at.present?
    
    @errors.add(:base, message: "The time segment hasn't started")
    true
  end
end

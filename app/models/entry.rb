class Entry < ActiveRecord::Base
  STATE_ARRAY = ['Alabama']
  # PRIZES = DAILY_PRIZES
  before_validation :downcase_email

  validates_presence_of :first_name, :last_name, :address, :zip, :email, :rules, message: 'Required'

  validates :email, email: true
  validate :in_promotion_period, :one_entry_per_day

  scope :mobile, -> { where(mobile: true) }
  scope :desktop, -> { where(mobile: false) }
  scope :newsletter_monthly, -> { where(opt_in: true) }
  scope :published, -> { where(published: true) }

  scope :created_between, lambda { |start_datetime, end_datetime|
    where(created_at: start_datetime...end_datetime)
  }

  def self.report_headers
    ['First Name', 'Last Name', 'Email', 'Address', 'City', 'State', 'Zip', 'Created']
  end

  def to_report_row
    [first_name, last_name, email, address, city, state, zip, created_at]
  end

  def set_env(mobile)
    self.mobile = mobile
  end

  def unconfirm_and_send
    Mailer.confirmation_email(self).deliver
    self.rules = false
    save(:validate => false)
  end

  def confirm_rules
    self.rules = true
    save(:validate => false)
  end

  def todays_prize_body(date)
    prizeresults = get_daily_prize_data(date)
    if prizeresults.nil?
      prizeresults = {'headline' => '', 'web_prize' => '', 'subhead' => '', 'body' => ''}
    else
      prizeresults
    end
    prizeresults
  end

  protected

  def downcase_email
    self.email = self.email.strip.downcase unless self.email.blank?
  end

  def one_entry_per_day
    previous_entry = Entry.where(email: email).where('created_at >= ?', Time.current.beginning_of_day).all
    if previous_entry.count > 0
      errors.add(:base, "You have already entered once today at #{previous_entry.first.created_at.strftime("%I:%M%p %Z")}")
    end
  end

  def in_promotion_period
    if Time.current < Rails.application.config.promotion_start
      errors.add(:base, "The sweepstakes starts on #{Rails.application.config.promotion_start.strftime("%B %e, %Y")}.")
    elsif Time.current > Rails.application.config.promotion_end
      errors.add(:base, 'The sweepstakes has ended.')
    end
  end
end
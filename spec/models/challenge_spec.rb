require 'rails_helper'

RSpec.describe Challenge, type: :model do
  before do
    @challenge = build(:challenge)
  end

  describe 'simple model pre-checks' do
    subject { @challenge }

    it { should validate_presence_of(:challenge) }
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:organizer) }

    it "should allow valid values" do
      %w(draft running completed cancelled).each do |v|
        should allow_value(v).for(:status)
      end
    end
    it { should_not allow_value("other").for(:status) }
  end

  describe 'fields' do
    subject { @challenge }

    it { should respond_to(:challenge) }
    it { should respond_to(:start_date) }
    it { should respond_to(:end_date) }
    it { should respond_to(:status) }
    it { should respond_to(:description) }
    it { should respond_to(:evaluation) }
    it { should respond_to(:evaluation_criteria) }
    it { should respond_to(:rules) }
    it { should respond_to(:prizes) }
    it { should respond_to(:resources) }
  end

  describe 'associations' do
    subject { @challenge }

    it { should respond_to(:timelines) }
    it { should respond_to(:submissions) }
    it { should respond_to(:participant_challenges) }
    it { should respond_to(:participants) }
  end

  describe 'specific validations' do
  end


  # === Relations ===
  it { is_expected.to belong_to :organizer }
  it { is_expected.to have_one :image }
  it { is_expected.to have_many :dataset_files }
  it { is_expected.to have_many :timelines }
  it { is_expected.to have_many :submissions }
  it { is_expected.to have_many :participant_challenges }
  it { is_expected.to have_many :participants }
  it { is_expected.to have_many :leaderboards }
  it { is_expected.to have_many :topics }

  # === Nested Attributes ===
  it { is_expected.to accept_nested_attributes_for :dataset_files }
  it { is_expected.to accept_nested_attributes_for :image }
  it { is_expected.to accept_nested_attributes_for :timelines }

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :organizer_id }
  it { is_expected.to have_db_column :challenge }
  it { is_expected.to have_db_column :status_cd }
  it { is_expected.to have_db_column :description }
  it { is_expected.to have_db_column :evaluation }
  it { is_expected.to have_db_column :evaluation_criteria }
  it { is_expected.to have_db_column :rules }
  it { is_expected.to have_db_column :prizes }
  it { is_expected.to have_db_column :resources }
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }
  it { is_expected.to have_db_column :dataset_description }
  it { is_expected.to have_db_column :submission_instructions }

  # === Database (Indexes) ===
  it { is_expected.to have_db_index ["organizer_id"] }

  # === Validations (Length) ===


  # === Validations (Presence) ===
  it { is_expected.to validate_presence_of :challenge }
  it { is_expected.to validate_presence_of :status }
  it { is_expected.to validate_presence_of :organizer }
end
module Negotiations
  class Offer
    class Status
      ValidStates = [:accepted, :declined, :invalid, :new]
      attr_accessor :state, :changed_by, :created_at
      class << self
        def from_company_and_state(company, state)
          new.tap do |status|
            status.state = _normalize_state! state
            status.changed_by = _normalize_company company
            status.created_at = DateTime.now
          end
        end

        private
        def _normalize_state!(state)
          return state if ValidStates.include? state
          throw "#{state} is not a valid offer state"
        end

        def _normalize_company(company)
          Negotiations::Company.normalize company
        end
      end
    end
  end
end



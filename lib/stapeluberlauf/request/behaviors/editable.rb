module Stapeluberlauf
  class Request
    module Behavior
      module Editable
        # Edits the given resource.
        #
        # @note auth required
        #
        # @return [Request]
        #
        def edit
          request('edit').auth_required!
        end
        
        # Deletes the given resource.
        #
        # @note auth required
        #
        # @return [Request]
        #
        def delete
          request('delete').auth_required!
        end
      end
    end
  end
end

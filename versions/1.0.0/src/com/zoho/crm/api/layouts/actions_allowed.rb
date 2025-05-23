require_relative '../util/model'

module ZOHOCRMSDK
  module Layouts
    class ActionsAllowed
      include Util::Model

      # Creates an instance of ActionsAllowed
      def initialize
        @edit = nil
        @rename = nil
        @clone = nil
        @downgrade = nil
        @delete = nil
        @deactivate = nil
        @set_layout_permissions = nil
        @add_field = nil
        @change_tab_traversal = nil
        @reorder = nil
        @remove_field = nil
        @change_column_count = nil
        @key_modified = Hash.new
      end

        # The method to get the edit
        # @return A Boolean value

      def edit
        @edit
      end

        # The method to set the value to edit
        # @param edit [Boolean] A Boolean

      def edit=(edit)
        if edit!=nil and ! [true, false].include?edit
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: edit EXPECTED TYPE: Boolean', nil, nil)
        end
        @edit = edit
        @key_modified['edit'] = 1
      end

        # The method to get the rename
        # @return A Boolean value

      def rename
        @rename
      end

        # The method to set the value to rename
        # @param rename [Boolean] A Boolean

      def rename=(rename)
        if rename!=nil and ! [true, false].include?rename
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: rename EXPECTED TYPE: Boolean', nil, nil)
        end
        @rename = rename
        @key_modified['rename'] = 1
      end

        # The method to get the clone
        # @return A Boolean value

      def clone
        @clone
      end

        # The method to set the value to clone
        # @param clone [Boolean] A Boolean

      def clone=(clone)
        if clone!=nil and ! [true, false].include?clone
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: clone EXPECTED TYPE: Boolean', nil, nil)
        end
        @clone = clone
        @key_modified['clone'] = 1
      end

        # The method to get the downgrade
        # @return A Boolean value

      def downgrade
        @downgrade
      end

        # The method to set the value to downgrade
        # @param downgrade [Boolean] A Boolean

      def downgrade=(downgrade)
        if downgrade!=nil and ! [true, false].include?downgrade
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: downgrade EXPECTED TYPE: Boolean', nil, nil)
        end
        @downgrade = downgrade
        @key_modified['downgrade'] = 1
      end

        # The method to get the delete
        # @return A Boolean value

      def delete
        @delete
      end

        # The method to set the value to delete
        # @param delete [Boolean] A Boolean

      def delete=(delete)
        if delete!=nil and ! [true, false].include?delete
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: delete EXPECTED TYPE: Boolean', nil, nil)
        end
        @delete = delete
        @key_modified[Constants::REQUEST_METHOD_DELETE] = 1
      end

        # The method to get the deactivate
        # @return A Boolean value

      def deactivate
        @deactivate
      end

        # The method to set the value to deactivate
        # @param deactivate [Boolean] A Boolean

      def deactivate=(deactivate)
        if deactivate!=nil and ! [true, false].include?deactivate
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: deactivate EXPECTED TYPE: Boolean', nil, nil)
        end
        @deactivate = deactivate
        @key_modified['deactivate'] = 1
      end

        # The method to get the set_layout_permissions
        # @return A Boolean value

      def layout_permissions
        @set_layout_permissions
      end

        # The method to set the value to set_layout_permissions
        # @param set_layout_permissions [Boolean] A Boolean

      def layout_permissions=(set_layout_permissions)
        if set_layout_permissions!=nil and ! [true, false].include?set_layout_permissions
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: set_layout_permissions EXPECTED TYPE: Boolean', nil, nil)
        end
        @set_layout_permissions = set_layout_permissions
        @key_modified['set_layout_permissions'] = 1
      end

        # The method to get the add_field
        # @return A Boolean value

      def add_field
        @add_field
      end

        # The method to set the value to add_field
        # @param add_field [Boolean] A Boolean

      def add_field=(add_field)
        if add_field!=nil and ! [true, false].include?add_field
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: add_field EXPECTED TYPE: Boolean', nil, nil)
        end
        @add_field = add_field
        @key_modified['add_field'] = 1
      end

        # The method to get the change_tab_traversal
        # @return A Boolean value

      def change_tab_traversal
        @change_tab_traversal
      end

        # The method to set the value to change_tab_traversal
        # @param change_tab_traversal [Boolean] A Boolean

      def change_tab_traversal=(change_tab_traversal)
        if change_tab_traversal!=nil and ! [true, false].include?change_tab_traversal
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: change_tab_traversal EXPECTED TYPE: Boolean', nil, nil)
        end
        @change_tab_traversal = change_tab_traversal
        @key_modified['change_tab_traversal'] = 1
      end

        # The method to get the reorder
        # @return A Boolean value

      def reorder
        @reorder
      end

        # The method to set the value to reorder
        # @param reorder [Boolean] A Boolean

      def reorder=(reorder)
        if reorder!=nil and ! [true, false].include?reorder
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: reorder EXPECTED TYPE: Boolean', nil, nil)
        end
        @reorder = reorder
        @key_modified['reorder'] = 1
      end

        # The method to get the remove_field
        # @return A Boolean value

      def remove_field
        @remove_field
      end

        # The method to set the value to remove_field
        # @param remove_field [Boolean] A Boolean

      def remove_field=(remove_field)
        if remove_field!=nil and ! [true, false].include?remove_field
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: remove_field EXPECTED TYPE: Boolean', nil, nil)
        end
        @remove_field = remove_field
        @key_modified['remove_field'] = 1
      end

        # The method to get the change_column_count
        # @return A Boolean value

      def change_column_count
        @change_column_count
      end

        # The method to set the value to change_column_count
        # @param change_column_count [Boolean] A Boolean

      def change_column_count=(change_column_count)
        if change_column_count!=nil and ! [true, false].include?change_column_count
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: change_column_count EXPECTED TYPE: Boolean', nil, nil)
        end
        @change_column_count = change_column_count
        @key_modified['change_column_count'] = 1
      end

        # The method to check if the user has modified the given key
        # @param key [String] A String
        # @return A Integer value

      def is_key_modified(key)
        if key!=nil and !key.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: key EXPECTED TYPE: String', nil, nil)
        end
        if @key_modified.key?(key)
          return @key_modified[key]
        end

        nil
      end

        # The method to mark the given key as modified
        # @param key [String] A String
        # @param modification [Integer] A Integer

      def set_key_modified(key, modification)
        if key!=nil and !key.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: key EXPECTED TYPE: String', nil, nil)
        end
        if modification!=nil and !modification.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: modification EXPECTED TYPE: Integer', nil, nil)
        end
        @key_modified[key] = modification
      end

    end
  end
end

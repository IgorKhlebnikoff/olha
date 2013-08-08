class Wish
  NOTICES = {
    'add' => lambda { |name, result|
      {
        'true' => I18n.t('lib.wishes.add.success', name: name),
        'false' => I18n.t('lib.wishes.add.exists', name: name)
      }
    },
    'remove' => {
      'true' => I18n.t('lib.wishes.remove.success'),
      'false' => I18n.t('lib.wishes.remove.error')
    }
  }

  def initialize(user)
    @user = user
  end

  def push(variant)
    result = if @user.wishes.include?(variant)
      false
    else
      @user.wishes << variant
      true
    end
    notice = NOTICES['add'].call(variant.name, result.to_s)
    outcome(result, notice)
  end

  def delete(variant)
    result = if @user.wishes.include?(variant)
      @user.wishes.delete(variant)
      true
    else
      false
    end
    notice = NOTICES['remove'][result.to_s]
    outcome(result, notice)
  end

  private

  def outcome(result, notice)
    {
      result: result,
      notice: notice
    }
  end
end

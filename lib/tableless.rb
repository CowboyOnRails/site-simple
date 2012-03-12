class Tableless
  # Подмешиваем валидаторы, методы преобразований
  # и методы соглашения об именовании для ActiveRecord
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  # Полезняшка, чтобы создавать свойства из конструктора
  def initialize(props = {})
    props.each do |name, value|
      send("#{name}=", value)
    end
  end

  # Переопределяем метод persisted?, чтобы он всегда
  # возвращал false. Это сообщает ActiveRecord,
  # что данные модели не сохраняются в БД.
  def persisted?
    false
  end
end
module ImportParts
  class Mapping

    def mappings
      @mappings ||= [
        {
          part_name: /^\s*Запчасть\s*$/i,
          car_vendor: /^\s*Марка\s*$/i,
          car_model: /^\s*Модель\s*$/i,
          price: /^\s*Цена\s*$/i,
          part_vendor: /^\s*Производитель\s*$/,
          part_number: /^\s*Номер производителя\s*$/,
          in_stock: /^\s*В наличии\s*$/
        },{
          part_name: /^\s*Название запчасти\s*$/i,
          car_vendor: /^\s*Марка\s*$/i,
          car_model: /^\s*Модель\s*$/i,
          price: /^\s*Стоимость\s*$/i,
          part_vendor: /^\s*Производитель\s*$/,
          part_number: /^\s*ОЕМ\s*$/,
          in_stock: /^\s*В наличии\s*$/
        },{
          part_name: /^\s*Запчасть\s*$/i,
          car_vendor: /^\s*Марка\s*$/i,
          car_model: /^\s*Модель\s*$/i,
          price: /^\s*Цена\s*$/i,
          part_vendor: /^\s*Производитель\s*$/,
          part_number: /^\s*ОЕМ\s*$/,
          in_stock: /^\s*В наличии\s*$/
        }
      ]
    end
  end
end

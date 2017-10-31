bom = %w[EF BB BF].map { |e| e.hex.chr }.join
CSV.generate(bom) do |csv|
  csv_column_names = %w[id 状態 受付案内所 受付者 種別 拾得場所 特徴 拾得者名 拾得者連絡先 備考 解決者]
  csv << csv_column_names
  @found_items.each do |found_item|
    csv_column_values = [
      found_item.id,
      found_item.status ? "解決済" : "未解決",
      ReceptionDesk.find(found_item.reception_desk_id).name,
      User.find(found_item.receptionist_id).name,
      found_item.kind_i18n,
      found_item.location_found,
      found_item.characteristic,
      found_item.finder_name.blank? ? "" : found_item.finder_name,
      found_item.finder_contact.blank? ? "" : found_item.finder_contact,
      found_item.note,
      found_item.resolver_id.nil? ? "" : User.find(found_item.resolver_id).name,
    ]
    csv << csv_column_values
  end
end

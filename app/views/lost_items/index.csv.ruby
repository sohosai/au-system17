bom = %w[EF BB BF].map { |e| e.hex.chr }.join
CSV.generate(bom) do |csv|
  csv_column_names = %w[id 状態 受付案内所 受付者 種別 紛失場所 特徴 紛失者名 紛失者連絡先 備考 解決者]
  csv << csv_column_names
  @lost_items.each do |lost_item|
    csv_column_values = [
      lost_item.id,
      lost_item.status ? "解決済" : "未解決",
      ReceptionDesk.find(lost_item.reception_desk_id).name,
      User.find(lost_item.receptionist_id).name,
      lost_item.kind_i18n,
      lost_item.location_lost,
      lost_item.characteristic,
      lost_item.loser_name.blank? ? "" : lost_item.loser_name,
      lost_item.loser_contact.blank? ? "" : lost_item.loser_contact,
      lost_item.note,
      lost_item.resolver_id.nil? ? "" : User.find(lost_item.resolver_id).name,
    ]
    csv << csv_column_values
  end
end

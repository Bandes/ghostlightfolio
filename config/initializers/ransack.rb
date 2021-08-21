Ransack.configure do |config|
  config.add_predicate 'contains',
    arel_predicate: 'contains',
    formatter: proc { |v| "{#{v}}" },
    validator: proc { |v| v.present? },
    type: :string
  config.custom_arrows = {
    up_arrow: '<i class="fa fa-arrow-up"></i>',
    down_arrow: '<i class="fa fa-arrow-down',
    default_arrow: '<i class="fa fa-arrow-down',
  }
end

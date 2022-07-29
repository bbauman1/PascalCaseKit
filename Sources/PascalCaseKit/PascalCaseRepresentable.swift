/// A `RawRepresentable` type that outputs a `rawValue` in Pascal Case format when `RawValue`
/// is of type `String`.
protocol PascalCaseRepresentable: RawRepresentable { }

extension PascalCaseRepresentable where Self.RawValue == String {

    var rawValue: RawValue {
        let value = String(describing: self)
        guard let first = value.first else { return "" }
        return first.uppercased() + value.dropFirst()
    }
}
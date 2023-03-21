//
//  RepositoryTests-RepositoryMocks.generated.swift
//  Repository
//
//  Generated by Mockingbird v0.19.0.
//  DO NOT EDIT
//

@testable import Mockingbird
@testable import Repository
import Combine
import CoreLocation
import Foundation
import Swift

private let genericStaticMockContext = Mockingbird.GenericStaticMockContext()

// MARK: - Mocked DailyWeatherDao
public final class DailyWeatherDaoMock: DailyWeatherDao, Mockingbird.Mock {
  typealias MockingbirdSupertype = DailyWeatherDao
  static let staticMock = Mockingbird.StaticMock()
  public let mockingbirdContext = Mockingbird.Context(["generator_version": "0.19.0", "module_name": "Repository"])

  fileprivate init(sourceLocation: Mockingbird.SourceLocation) {
    self.mockingbirdContext.sourceLocation = sourceLocation
    DailyWeatherDaoMock.staticMock.mockingbirdContext.sourceLocation = sourceLocation
  }

  // MARK: Mocked `clearDailyWeathers`()
  public func `clearDailyWeathers`() -> Void {
    return self.mockingbirdContext.mocking.didInvoke(Mockingbird.SwiftInvocation(selectorName: "`clearDailyWeathers`() -> Void", selectorType: Mockingbird.SelectorType.method, arguments: [], returnType: Swift.ObjectIdentifier((Void).self))) {
      self.mockingbirdContext.recordInvocation($0)
      let mkbImpl = self.mockingbirdContext.stubbing.implementation(for: $0)
      if let mkbImpl = mkbImpl as? () -> Void { return mkbImpl() }
      for mkbTargetBox in self.mockingbirdContext.proxy.targets(for: $0) {
        switch mkbTargetBox.target {
        case .super:
          break
        case .object(let mkbObject):
          guard var mkbObject = mkbObject as? MockingbirdSupertype else { break }
          let mkbValue: Void = mkbObject.`clearDailyWeathers`()
          self.mockingbirdContext.proxy.updateTarget(&mkbObject, in: mkbTargetBox)
          return mkbValue
        }
      }
      if let mkbValue = self.mockingbirdContext.stubbing.defaultValueProvider.value.provideValue(for: (Void).self) { return mkbValue }
      self.mockingbirdContext.stubbing.failTest(for: $0, at: self.mockingbirdContext.sourceLocation)
    }
  }

  public func `clearDailyWeathers`() -> Mockingbird.Mockable<Mockingbird.FunctionDeclaration, () -> Void, Void> {
    return Mockingbird.Mockable<Mockingbird.FunctionDeclaration, () -> Void, Void>(mock: self, invocation: Mockingbird.SwiftInvocation(selectorName: "`clearDailyWeathers`() -> Void", selectorType: Mockingbird.SelectorType.method, arguments: [], returnType: Swift.ObjectIdentifier((Void).self)))
  }

  // MARK: Mocked `saveDailyWeathers`(_ `lat`: Double, _ `lon`: Double, `dailyWeathers`: [Day])
  public func `saveDailyWeathers`(_ `lat`: Double, _ `lon`: Double, `dailyWeathers`: [Day]) -> Void {
    return self.mockingbirdContext.mocking.didInvoke(Mockingbird.SwiftInvocation(selectorName: "`saveDailyWeathers`(_ `lat`: Double, _ `lon`: Double, `dailyWeathers`: [Day]) -> Void", selectorType: Mockingbird.SelectorType.method, arguments: [Mockingbird.ArgumentMatcher(`lat`), Mockingbird.ArgumentMatcher(`lon`), Mockingbird.ArgumentMatcher(`dailyWeathers`)], returnType: Swift.ObjectIdentifier((Void).self))) {
      self.mockingbirdContext.recordInvocation($0)
      let mkbImpl = self.mockingbirdContext.stubbing.implementation(for: $0)
      if let mkbImpl = mkbImpl as? (Double, Double, [Day]) -> Void { return mkbImpl(`lat`, `lon`, `dailyWeathers`) }
      if let mkbImpl = mkbImpl as? () -> Void { return mkbImpl() }
      for mkbTargetBox in self.mockingbirdContext.proxy.targets(for: $0) {
        switch mkbTargetBox.target {
        case .super:
          break
        case .object(let mkbObject):
          guard var mkbObject = mkbObject as? MockingbirdSupertype else { break }
          let mkbValue: Void = mkbObject.`saveDailyWeathers`(`lat`, `lon`, dailyWeathers: `dailyWeathers`)
          self.mockingbirdContext.proxy.updateTarget(&mkbObject, in: mkbTargetBox)
          return mkbValue
        }
      }
      if let mkbValue = self.mockingbirdContext.stubbing.defaultValueProvider.value.provideValue(for: (Void).self) { return mkbValue }
      self.mockingbirdContext.stubbing.failTest(for: $0, at: self.mockingbirdContext.sourceLocation)
    }
  }

  public func `saveDailyWeathers`(_ `lat`: @autoclosure () -> Double, _ `lon`: @autoclosure () -> Double, `dailyWeathers`: @autoclosure () -> [Day]) -> Mockingbird.Mockable<Mockingbird.FunctionDeclaration, (Double, Double, [Day]) -> Void, Void> {
    return Mockingbird.Mockable<Mockingbird.FunctionDeclaration, (Double, Double, [Day]) -> Void, Void>(mock: self, invocation: Mockingbird.SwiftInvocation(selectorName: "`saveDailyWeathers`(_ `lat`: Double, _ `lon`: Double, `dailyWeathers`: [Day]) -> Void", selectorType: Mockingbird.SelectorType.method, arguments: [Mockingbird.resolve(`lat`), Mockingbird.resolve(`lon`), Mockingbird.resolve(`dailyWeathers`)], returnType: Swift.ObjectIdentifier((Void).self)))
  }

  // MARK: Mocked `getDailyWeathers`(_ `lat`: Double, _ `lon`: Double)
  public func `getDailyWeathers`(_ `lat`: Double, _ `lon`: Double) -> [Day]? {
    return self.mockingbirdContext.mocking.didInvoke(Mockingbird.SwiftInvocation(selectorName: "`getDailyWeathers`(_ `lat`: Double, _ `lon`: Double) -> [Day]?", selectorType: Mockingbird.SelectorType.method, arguments: [Mockingbird.ArgumentMatcher(`lat`), Mockingbird.ArgumentMatcher(`lon`)], returnType: Swift.ObjectIdentifier(([Day]?).self))) {
      self.mockingbirdContext.recordInvocation($0)
      let mkbImpl = self.mockingbirdContext.stubbing.implementation(for: $0)
      if let mkbImpl = mkbImpl as? (Double, Double) -> [Day]? { return mkbImpl(`lat`, `lon`) }
      if let mkbImpl = mkbImpl as? () -> [Day]? { return mkbImpl() }
      for mkbTargetBox in self.mockingbirdContext.proxy.targets(for: $0) {
        switch mkbTargetBox.target {
        case .super:
          break
        case .object(let mkbObject):
          guard var mkbObject = mkbObject as? MockingbirdSupertype else { break }
          let mkbValue: [Day]? = mkbObject.`getDailyWeathers`(`lat`, `lon`)
          self.mockingbirdContext.proxy.updateTarget(&mkbObject, in: mkbTargetBox)
          return mkbValue
        }
      }
      if let mkbValue = self.mockingbirdContext.stubbing.defaultValueProvider.value.provideValue(for: ([Day]?).self) { return mkbValue }
      self.mockingbirdContext.stubbing.failTest(for: $0, at: self.mockingbirdContext.sourceLocation)
    }
  }

  public func `getDailyWeathers`(_ `lat`: @autoclosure () -> Double, _ `lon`: @autoclosure () -> Double) -> Mockingbird.Mockable<Mockingbird.FunctionDeclaration, (Double, Double) -> [Day]?, [Day]?> {
    return Mockingbird.Mockable<Mockingbird.FunctionDeclaration, (Double, Double) -> [Day]?, [Day]?>(mock: self, invocation: Mockingbird.SwiftInvocation(selectorName: "`getDailyWeathers`(_ `lat`: Double, _ `lon`: Double) -> [Day]?", selectorType: Mockingbird.SelectorType.method, arguments: [Mockingbird.resolve(`lat`), Mockingbird.resolve(`lon`)], returnType: Swift.ObjectIdentifier(([Day]?).self)))
  }
}

/// Returns a concrete mock of `DailyWeatherDao`.
public func mock(_ type: DailyWeatherDao.Protocol, file: StaticString = #file, line: UInt = #line) -> DailyWeatherDaoMock {
  return DailyWeatherDaoMock(sourceLocation: Mockingbird.SourceLocation(file, line))
}

// MARK: - Mocked HourlyWeatherDao
public final class HourlyWeatherDaoMock: HourlyWeatherDao, Mockingbird.Mock {
  typealias MockingbirdSupertype = HourlyWeatherDao
  static let staticMock = Mockingbird.StaticMock()
  public let mockingbirdContext = Mockingbird.Context(["generator_version": "0.19.0", "module_name": "Repository"])

  fileprivate init(sourceLocation: Mockingbird.SourceLocation) {
    self.mockingbirdContext.sourceLocation = sourceLocation
    HourlyWeatherDaoMock.staticMock.mockingbirdContext.sourceLocation = sourceLocation
  }

  // MARK: Mocked `clearHourlyWeathers`()
  public func `clearHourlyWeathers`() -> Void {
    return self.mockingbirdContext.mocking.didInvoke(Mockingbird.SwiftInvocation(selectorName: "`clearHourlyWeathers`() -> Void", selectorType: Mockingbird.SelectorType.method, arguments: [], returnType: Swift.ObjectIdentifier((Void).self))) {
      self.mockingbirdContext.recordInvocation($0)
      let mkbImpl = self.mockingbirdContext.stubbing.implementation(for: $0)
      if let mkbImpl = mkbImpl as? () -> Void { return mkbImpl() }
      for mkbTargetBox in self.mockingbirdContext.proxy.targets(for: $0) {
        switch mkbTargetBox.target {
        case .super:
          break
        case .object(let mkbObject):
          guard var mkbObject = mkbObject as? MockingbirdSupertype else { break }
          let mkbValue: Void = mkbObject.`clearHourlyWeathers`()
          self.mockingbirdContext.proxy.updateTarget(&mkbObject, in: mkbTargetBox)
          return mkbValue
        }
      }
      if let mkbValue = self.mockingbirdContext.stubbing.defaultValueProvider.value.provideValue(for: (Void).self) { return mkbValue }
      self.mockingbirdContext.stubbing.failTest(for: $0, at: self.mockingbirdContext.sourceLocation)
    }
  }

  public func `clearHourlyWeathers`() -> Mockingbird.Mockable<Mockingbird.FunctionDeclaration, () -> Void, Void> {
    return Mockingbird.Mockable<Mockingbird.FunctionDeclaration, () -> Void, Void>(mock: self, invocation: Mockingbird.SwiftInvocation(selectorName: "`clearHourlyWeathers`() -> Void", selectorType: Mockingbird.SelectorType.method, arguments: [], returnType: Swift.ObjectIdentifier((Void).self)))
  }

  // MARK: Mocked `saveHourlyWeathers`(_ `lat`: Double, _ `lon`: Double, `date`: Date, `hourlyWeathers`: [Hour])
  public func `saveHourlyWeathers`(_ `lat`: Double, _ `lon`: Double, `date`: Date, `hourlyWeathers`: [Hour]) -> Void {
    return self.mockingbirdContext.mocking.didInvoke(Mockingbird.SwiftInvocation(selectorName: "`saveHourlyWeathers`(_ `lat`: Double, _ `lon`: Double, `date`: Date, `hourlyWeathers`: [Hour]) -> Void", selectorType: Mockingbird.SelectorType.method, arguments: [Mockingbird.ArgumentMatcher(`lat`), Mockingbird.ArgumentMatcher(`lon`), Mockingbird.ArgumentMatcher(`date`), Mockingbird.ArgumentMatcher(`hourlyWeathers`)], returnType: Swift.ObjectIdentifier((Void).self))) {
      self.mockingbirdContext.recordInvocation($0)
      let mkbImpl = self.mockingbirdContext.stubbing.implementation(for: $0)
      if let mkbImpl = mkbImpl as? (Double, Double, Date, [Hour]) -> Void { return mkbImpl(`lat`, `lon`, `date`, `hourlyWeathers`) }
      if let mkbImpl = mkbImpl as? () -> Void { return mkbImpl() }
      for mkbTargetBox in self.mockingbirdContext.proxy.targets(for: $0) {
        switch mkbTargetBox.target {
        case .super:
          break
        case .object(let mkbObject):
          guard var mkbObject = mkbObject as? MockingbirdSupertype else { break }
          let mkbValue: Void = mkbObject.`saveHourlyWeathers`(`lat`, `lon`, date: `date`, hourlyWeathers: `hourlyWeathers`)
          self.mockingbirdContext.proxy.updateTarget(&mkbObject, in: mkbTargetBox)
          return mkbValue
        }
      }
      if let mkbValue = self.mockingbirdContext.stubbing.defaultValueProvider.value.provideValue(for: (Void).self) { return mkbValue }
      self.mockingbirdContext.stubbing.failTest(for: $0, at: self.mockingbirdContext.sourceLocation)
    }
  }

  public func `saveHourlyWeathers`(_ `lat`: @autoclosure () -> Double, _ `lon`: @autoclosure () -> Double, `date`: @autoclosure () -> Date, `hourlyWeathers`: @autoclosure () -> [Hour]) -> Mockingbird.Mockable<Mockingbird.FunctionDeclaration, (Double, Double, Date, [Hour]) -> Void, Void> {
    return Mockingbird.Mockable<Mockingbird.FunctionDeclaration, (Double, Double, Date, [Hour]) -> Void, Void>(mock: self, invocation: Mockingbird.SwiftInvocation(selectorName: "`saveHourlyWeathers`(_ `lat`: Double, _ `lon`: Double, `date`: Date, `hourlyWeathers`: [Hour]) -> Void", selectorType: Mockingbird.SelectorType.method, arguments: [Mockingbird.resolve(`lat`), Mockingbird.resolve(`lon`), Mockingbird.resolve(`date`), Mockingbird.resolve(`hourlyWeathers`)], returnType: Swift.ObjectIdentifier((Void).self)))
  }

  // MARK: Mocked `getHourlyWeathers`(_ `lat`: Double, _ `lon`: Double, `date`: Date)
  public func `getHourlyWeathers`(_ `lat`: Double, _ `lon`: Double, `date`: Date) -> [Hour]? {
    return self.mockingbirdContext.mocking.didInvoke(Mockingbird.SwiftInvocation(selectorName: "`getHourlyWeathers`(_ `lat`: Double, _ `lon`: Double, `date`: Date) -> [Hour]?", selectorType: Mockingbird.SelectorType.method, arguments: [Mockingbird.ArgumentMatcher(`lat`), Mockingbird.ArgumentMatcher(`lon`), Mockingbird.ArgumentMatcher(`date`)], returnType: Swift.ObjectIdentifier(([Hour]?).self))) {
      self.mockingbirdContext.recordInvocation($0)
      let mkbImpl = self.mockingbirdContext.stubbing.implementation(for: $0)
      if let mkbImpl = mkbImpl as? (Double, Double, Date) -> [Hour]? { return mkbImpl(`lat`, `lon`, `date`) }
      if let mkbImpl = mkbImpl as? () -> [Hour]? { return mkbImpl() }
      for mkbTargetBox in self.mockingbirdContext.proxy.targets(for: $0) {
        switch mkbTargetBox.target {
        case .super:
          break
        case .object(let mkbObject):
          guard var mkbObject = mkbObject as? MockingbirdSupertype else { break }
          let mkbValue: [Hour]? = mkbObject.`getHourlyWeathers`(`lat`, `lon`, date: `date`)
          self.mockingbirdContext.proxy.updateTarget(&mkbObject, in: mkbTargetBox)
          return mkbValue
        }
      }
      if let mkbValue = self.mockingbirdContext.stubbing.defaultValueProvider.value.provideValue(for: ([Hour]?).self) { return mkbValue }
      self.mockingbirdContext.stubbing.failTest(for: $0, at: self.mockingbirdContext.sourceLocation)
    }
  }

  public func `getHourlyWeathers`(_ `lat`: @autoclosure () -> Double, _ `lon`: @autoclosure () -> Double, `date`: @autoclosure () -> Date) -> Mockingbird.Mockable<Mockingbird.FunctionDeclaration, (Double, Double, Date) -> [Hour]?, [Hour]?> {
    return Mockingbird.Mockable<Mockingbird.FunctionDeclaration, (Double, Double, Date) -> [Hour]?, [Hour]?>(mock: self, invocation: Mockingbird.SwiftInvocation(selectorName: "`getHourlyWeathers`(_ `lat`: Double, _ `lon`: Double, `date`: Date) -> [Hour]?", selectorType: Mockingbird.SelectorType.method, arguments: [Mockingbird.resolve(`lat`), Mockingbird.resolve(`lon`), Mockingbird.resolve(`date`)], returnType: Swift.ObjectIdentifier(([Hour]?).self)))
  }
}

/// Returns a concrete mock of `HourlyWeatherDao`.
public func mock(_ type: HourlyWeatherDao.Protocol, file: StaticString = #file, line: UInt = #line) -> HourlyWeatherDaoMock {
  return HourlyWeatherDaoMock(sourceLocation: Mockingbird.SourceLocation(file, line))
}

// MARK: - Mocked WeatherApi
public final class WeatherApiMock: WeatherApi, Mockingbird.Mock {
  typealias MockingbirdSupertype = WeatherApi
  static let staticMock = Mockingbird.StaticMock()
  public let mockingbirdContext = Mockingbird.Context(["generator_version": "0.19.0", "module_name": "Repository"])

  fileprivate init(sourceLocation: Mockingbird.SourceLocation) {
    self.mockingbirdContext.sourceLocation = sourceLocation
    WeatherApiMock.staticMock.mockingbirdContext.sourceLocation = sourceLocation
  }

  // MARK: Mocked `fetchWeatherDaily`(_ `lat`: Double, _ `lon`: Double)
  public func `fetchWeatherDaily`(_ `lat`: Double, _ `lon`: Double) -> AnyPublisher<[Day], Error> {
    return self.mockingbirdContext.mocking.didInvoke(Mockingbird.SwiftInvocation(selectorName: "`fetchWeatherDaily`(_ `lat`: Double, _ `lon`: Double) -> AnyPublisher<[Day], Error>", selectorType: Mockingbird.SelectorType.method, arguments: [Mockingbird.ArgumentMatcher(`lat`), Mockingbird.ArgumentMatcher(`lon`)], returnType: Swift.ObjectIdentifier((AnyPublisher<[Day], Error>).self))) {
      self.mockingbirdContext.recordInvocation($0)
      let mkbImpl = self.mockingbirdContext.stubbing.implementation(for: $0)
      if let mkbImpl = mkbImpl as? (Double, Double) -> AnyPublisher<[Day], Error> { return mkbImpl(`lat`, `lon`) }
      if let mkbImpl = mkbImpl as? () -> AnyPublisher<[Day], Error> { return mkbImpl() }
      for mkbTargetBox in self.mockingbirdContext.proxy.targets(for: $0) {
        switch mkbTargetBox.target {
        case .super:
          break
        case .object(let mkbObject):
          guard var mkbObject = mkbObject as? MockingbirdSupertype else { break }
          let mkbValue: AnyPublisher<[Day], Error> = mkbObject.`fetchWeatherDaily`(`lat`, `lon`)
          self.mockingbirdContext.proxy.updateTarget(&mkbObject, in: mkbTargetBox)
          return mkbValue
        }
      }
      if let mkbValue = self.mockingbirdContext.stubbing.defaultValueProvider.value.provideValue(for: (AnyPublisher<[Day], Error>).self) { return mkbValue }
      self.mockingbirdContext.stubbing.failTest(for: $0, at: self.mockingbirdContext.sourceLocation)
    }
  }

  public func `fetchWeatherDaily`(_ `lat`: @autoclosure () -> Double, _ `lon`: @autoclosure () -> Double) -> Mockingbird.Mockable<Mockingbird.FunctionDeclaration, (Double, Double) -> AnyPublisher<[Day], Error>, AnyPublisher<[Day], Error>> {
    return Mockingbird.Mockable<Mockingbird.FunctionDeclaration, (Double, Double) -> AnyPublisher<[Day], Error>, AnyPublisher<[Day], Error>>(mock: self, invocation: Mockingbird.SwiftInvocation(selectorName: "`fetchWeatherDaily`(_ `lat`: Double, _ `lon`: Double) -> AnyPublisher<[Day], Error>", selectorType: Mockingbird.SelectorType.method, arguments: [Mockingbird.resolve(`lat`), Mockingbird.resolve(`lon`)], returnType: Swift.ObjectIdentifier((AnyPublisher<[Day], Error>).self)))
  }

  // MARK: Mocked `fetchWeatherHourly`(_ `lat`: Double, _ `lon`: Double, `date`: Date)
  public func `fetchWeatherHourly`(_ `lat`: Double, _ `lon`: Double, `date`: Date) -> AnyPublisher<[Hour], Error> {
    return self.mockingbirdContext.mocking.didInvoke(Mockingbird.SwiftInvocation(selectorName: "`fetchWeatherHourly`(_ `lat`: Double, _ `lon`: Double, `date`: Date) -> AnyPublisher<[Hour], Error>", selectorType: Mockingbird.SelectorType.method, arguments: [Mockingbird.ArgumentMatcher(`lat`), Mockingbird.ArgumentMatcher(`lon`), Mockingbird.ArgumentMatcher(`date`)], returnType: Swift.ObjectIdentifier((AnyPublisher<[Hour], Error>).self))) {
      self.mockingbirdContext.recordInvocation($0)
      let mkbImpl = self.mockingbirdContext.stubbing.implementation(for: $0)
      if let mkbImpl = mkbImpl as? (Double, Double, Date) -> AnyPublisher<[Hour], Error> { return mkbImpl(`lat`, `lon`, `date`) }
      if let mkbImpl = mkbImpl as? () -> AnyPublisher<[Hour], Error> { return mkbImpl() }
      for mkbTargetBox in self.mockingbirdContext.proxy.targets(for: $0) {
        switch mkbTargetBox.target {
        case .super:
          break
        case .object(let mkbObject):
          guard var mkbObject = mkbObject as? MockingbirdSupertype else { break }
          let mkbValue: AnyPublisher<[Hour], Error> = mkbObject.`fetchWeatherHourly`(`lat`, `lon`, date: `date`)
          self.mockingbirdContext.proxy.updateTarget(&mkbObject, in: mkbTargetBox)
          return mkbValue
        }
      }
      if let mkbValue = self.mockingbirdContext.stubbing.defaultValueProvider.value.provideValue(for: (AnyPublisher<[Hour], Error>).self) { return mkbValue }
      self.mockingbirdContext.stubbing.failTest(for: $0, at: self.mockingbirdContext.sourceLocation)
    }
  }

  public func `fetchWeatherHourly`(_ `lat`: @autoclosure () -> Double, _ `lon`: @autoclosure () -> Double, `date`: @autoclosure () -> Date) -> Mockingbird.Mockable<Mockingbird.FunctionDeclaration, (Double, Double, Date) -> AnyPublisher<[Hour], Error>, AnyPublisher<[Hour], Error>> {
    return Mockingbird.Mockable<Mockingbird.FunctionDeclaration, (Double, Double, Date) -> AnyPublisher<[Hour], Error>, AnyPublisher<[Hour], Error>>(mock: self, invocation: Mockingbird.SwiftInvocation(selectorName: "`fetchWeatherHourly`(_ `lat`: Double, _ `lon`: Double, `date`: Date) -> AnyPublisher<[Hour], Error>", selectorType: Mockingbird.SelectorType.method, arguments: [Mockingbird.resolve(`lat`), Mockingbird.resolve(`lon`), Mockingbird.resolve(`date`)], returnType: Swift.ObjectIdentifier((AnyPublisher<[Hour], Error>).self)))
  }
}

/// Returns a concrete mock of `WeatherApi`.
public func mock(_ type: WeatherApi.Protocol, file: StaticString = #file, line: UInt = #line) -> WeatherApiMock {
  return WeatherApiMock(sourceLocation: Mockingbird.SourceLocation(file, line))
}

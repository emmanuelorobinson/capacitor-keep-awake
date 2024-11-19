import Capacitor
import Foundation

/// Please read the Capacitor iOS Plugin Development Guide
/// here: https://capacitorjs.com/docs/plugins/ios
@objc(KeepAwakePlugin)
public class KeepAwakePlugin: CAPPlugin, CAPBridgedPlugin {
    public let identifier = "KeepAwakePlugin"
    public let jsName = "KeepAwake"

    public let pluginMethods: [CAPPluginMethod] = [
        CAPPluginMethod(name: "enable", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "disable", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "isEnabled", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "echo", returnType: CAPPluginReturnPromise),
    ]
    private let implementation = KeepAwake()
    private var isKeepingAwake = false

    @objc func echo(_ call: CAPPluginCall) {
        let value = call.getString("value") ?? ""
        call.resolve([
            "value": implementation.echo(value)
        ])
    }
    @objc func enable(_ call: CAPPluginCall) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                call.reject("Plugin instance is no longer available")
                return
            }

            if !self.isKeepingAwake {
                UIApplication.shared.isIdleTimerDisabled = true
                self.isKeepingAwake = true
            }

            call.resolve()
        }
    }

    @objc func disable(_ call: CAPPluginCall) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                call.reject("Plugin instance is no longer available")
                return
            }

            if self.isKeepingAwake {
                UIApplication.shared.isIdleTimerDisabled = false
                self.isKeepingAwake = false
            }

            call.resolve()
        }
    }

    @objc func isEnabled(_ call: CAPPluginCall) {
        call.resolve([
            "value": isKeepingAwake
        ])
    }

}

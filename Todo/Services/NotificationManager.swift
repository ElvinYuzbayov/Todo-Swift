import Foundation
import UserNotifications

final class NotificationManager {
    static let shared = NotificationManager()
    private init() {}

    func requestAuthorization() {
        //access for notification
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if let error = error { print("Notif permission error:", error) }
            print("Notif granted:", granted)
        }
    }

    func schedule(todoId: UUID, title: String, date: Date) {
        // Keçmiş tarixdirsə schedule etmə
        if date <= Date() { return }

        let content = UNMutableNotificationContent()
        content.title = "Todo reminder"
        content.body = title
        content.sound = .default

        let components = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)

        let request = UNNotificationRequest(
            identifier: todoId.uuidString,
            content: content,
            trigger: trigger
        )

        UNUserNotificationCenter.current().add(request) { error in
            if let error = error { print("Schedule error:", error) }
        }
    }

    func cancel(todoId: UUID) {
        UNUserNotificationCenter.current()
            .removePendingNotificationRequests(withIdentifiers: [todoId.uuidString])
    }
}

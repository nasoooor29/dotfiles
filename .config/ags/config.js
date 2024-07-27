// import { Media } from "./Media.js"
import { Left, Right } from "./Nav.js"
// import { NotificationPopups } from "./Notifications.js";


function Bar(monitor = 0) {
    return Widget.Window({
        name: `bar-${monitor}`, // name has to be unique
        class_name: "bar",
        monitor,
        anchor: ["top", "left", "right"],
        exclusivity: "exclusive",
        child: Widget.CenterBox({
            start_widget: Left(),
            end_widget: Right(),
        }),
    })
}

// const win = Widget.Window({
//     name: "mpris",
//     anchor: ["top", "right"],
//     child: Media(),
// })


// Utils.timeout(100, () => Utils.notify({
//     summary: "Notification Popup Example",
//     iconName: "info-symbolic",
//     body: "Lorem ipsum dolor sit amet, qui minim labore adipisicing "
//         + "minim sint cillum sint consectetur cupidatat.",
//     actions: {
//         "Cool": () => print("pressed Cool"),
//     },
// }))

App.config({
    style: "./style.css",
    windows: [
        Bar(),
        // win,
        // NotificationPopups(),
    ],
})
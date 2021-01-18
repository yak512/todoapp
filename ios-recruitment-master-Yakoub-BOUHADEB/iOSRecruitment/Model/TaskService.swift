import Foundation

struct Task {
    var title = ""
    var done = true
    var text =
    """
 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ultricies blandit velit, eu viverra mi feugiat non. Cras et venenatis eros, et facilisis nunc. Curabitur ac ornare tellus. Nullam posuere enim et nisi aliquet lobortis. Ut id tincidunt ipsum. Ut at libero in ligula fringilla luctus vel sit amet nunc. Proin sed ex quam. Etiam a consequat sapien. Nam tristique, nibh vitae sagittis sagittis, risus nulla consequat purus, eu molestie metus diam tincidunt lectus. Nam massa urna, porta sit amet lorem sit amet, pellentesque consectetur mi. Sed malesuada, mauris vel volutpat laoreet, urna nisl dictum nisl, eu auctor lectus sapien vitae leo. Quisque ultrices vestibulum nisl egestas bibendum.
 """
    var identifier: String = UUID().uuidString

}

struct Tasks {
    var tasks = [Task(title: "Faire les course", done: false), Task(title: "Faire mes devoirs",done: false), Task(title: "Se brosser les dents", done: true), Task(title: "Prendre une douche", done: false), Task(title: "Apprendre le language de programation Swif", done: true), Task(title: "Promener le chien", done: false)]
}

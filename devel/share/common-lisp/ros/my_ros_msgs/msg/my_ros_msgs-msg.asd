
(cl:in-package :asdf)

(defsystem "my_ros_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "hw2" :depends-on ("_package_hw2"))
    (:file "_package_hw2" :depends-on ("_package"))
    (:file "my_IoT" :depends-on ("_package_my_IoT"))
    (:file "_package_my_IoT" :depends-on ("_package"))
  ))
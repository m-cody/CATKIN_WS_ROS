;; Auto-generated. Do not edit!


(when (boundp 'my_ros_msgs::hw2)
  (if (not (find-package "MY_ROS_MSGS"))
    (make-package "MY_ROS_MSGS"))
  (shadow 'hw2 (find-package "MY_ROS_MSGS")))
(unless (find-package "MY_ROS_MSGS::HW2")
  (make-package "MY_ROS_MSGS::HW2"))

(in-package "ROS")
;;//! \htmlinclude hw2.msg.html


(defclass my_ros_msgs::hw2
  :super ros::object
  :slots (_message _command ))

(defmethod my_ros_msgs::hw2
  (:init
   (&key
    ((:message __message) "")
    ((:command __command) 0)
    )
   (send-super :init)
   (setq _message (string __message))
   (setq _command (round __command))
   self)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:command
   (&optional __command)
   (if __command (setq _command __command)) _command)
  (:serialization-length
   ()
   (+
    ;; string _message
    4 (length _message)
    ;; uint8 _command
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;; uint8 _command
       (write-byte _command s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint8 _command
     (setq _command (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get my_ros_msgs::hw2 :md5sum-) "180698a25f3b4080cbf72c632befde42")
(setf (get my_ros_msgs::hw2 :datatype-) "my_ros_msgs/hw2")
(setf (get my_ros_msgs::hw2 :definition-)
      "string message
uint8 command

")



(provide :my_ros_msgs/hw2 "180698a25f3b4080cbf72c632befde42")



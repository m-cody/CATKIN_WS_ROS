;; Auto-generated. Do not edit!


(when (boundp 'my_ros_msgs::my_IoT)
  (if (not (find-package "MY_ROS_MSGS"))
    (make-package "MY_ROS_MSGS"))
  (shadow 'my_IoT (find-package "MY_ROS_MSGS")))
(unless (find-package "MY_ROS_MSGS::MY_IOT")
  (make-package "MY_ROS_MSGS::MY_IOT"))

(in-package "ROS")
;;//! \htmlinclude my_IoT.msg.html


(defclass my_ros_msgs::my_IoT
  :super ros::object
  :slots (_temperature _humidity _status _location ))

(defmethod my_ros_msgs::my_IoT
  (:init
   (&key
    ((:temperature __temperature) 0)
    ((:humidity __humidity) 0)
    ((:status __status) nil)
    ((:location __location) "")
    )
   (send-super :init)
   (setq _temperature (round __temperature))
   (setq _humidity (round __humidity))
   (setq _status __status)
   (setq _location (string __location))
   self)
  (:temperature
   (&optional __temperature)
   (if __temperature (setq _temperature __temperature)) _temperature)
  (:humidity
   (&optional __humidity)
   (if __humidity (setq _humidity __humidity)) _humidity)
  (:status
   (&optional __status)
   (if __status (setq _status __status)) _status)
  (:location
   (&optional __location)
   (if __location (setq _location __location)) _location)
  (:serialization-length
   ()
   (+
    ;; int64 _temperature
    8
    ;; uint8 _humidity
    1
    ;; bool _status
    1
    ;; string _location
    4 (length _location)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _temperature
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _temperature (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _temperature) (= (length (_temperature . bv)) 2)) ;; bignum
              (write-long (ash (elt (_temperature . bv) 0) 0) s)
              (write-long (ash (elt (_temperature . bv) 1) -1) s))
             ((and (class _temperature) (= (length (_temperature . bv)) 1)) ;; big1
              (write-long (elt (_temperature . bv) 0) s)
              (write-long (if (>= _temperature 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _temperature s)(write-long (if (>= _temperature 0) 0 #xffffffff) s)))
     ;; uint8 _humidity
       (write-byte _humidity s)
     ;; bool _status
       (if _status (write-byte -1 s) (write-byte 0 s))
     ;; string _location
       (write-long (length _location) s) (princ _location s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _temperature
#+(or :alpha :irix6 :x86_64)
      (setf _temperature (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _temperature (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; uint8 _humidity
     (setq _humidity (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; bool _status
     (setq _status (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _location
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _location (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get my_ros_msgs::my_IoT :md5sum-) "b6edeaa3532f795fb8e5e11041bdf1b5")
(setf (get my_ros_msgs::my_IoT :datatype-) "my_ros_msgs/my_IoT")
(setf (get my_ros_msgs::my_IoT :definition-)
      "int64 temperature
uint8 humidity
bool status
string location

")



(provide :my_ros_msgs/my_IoT "b6edeaa3532f795fb8e5e11041bdf1b5")



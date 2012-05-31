(defun hackersAndLawyers (step)

                              (cond ((equal step 0)
			         (print "Sending over one hacker and one lawyer to courtroom")
                              ))

                              (cond ((equal step 1)
			         (print "Sending one hacker back to hotel")
                              ))

                              (cond ((equal step 2)
			         (print "Sending over two lawyers to courtroom")
                              ))

                              (cond ((equal step 3)
			         (print "Sending back one lawyer to hotel")
                              ))

                              (cond ((equal step 4)
			         (print "Sending over two hackers to courtroom")
                              ))

                              (cond ((equal step 5)
			         (print "Sending back one hacker and one lawyer to hotel")
                              ))

                              (cond ((equal step 6)
			         (print "Sending over two hackers to courtroom")
                              ))

                              (cond ((equal step 7)
			         (print "Sending back one lawyer to hotel")
                              ))

                              (cond ((equal step 8)
			         (print "Sending over two lawyers to courtroom")
                              ))

                              (cond ((equal step 9)
			         (print "Sending back one lawyer to hotel")
                              ))

                              (cond ((equal step 10)
			         (print "Sending over two lawyers to courtroom")
                              ))

                              (incf step)
                              
                              (cond ((< step  11)
			         (hackersAndLawyers step)
                              ))

)

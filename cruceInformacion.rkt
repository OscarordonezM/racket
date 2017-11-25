#lang racket
(require db)

(define pgc
(mysql-connect   #:server "localhost"
                 #:port 3306
                 #:database "AquaBot"
                 #:user "root"
                 ))




(define listaPV '())
(define listaCM '())

(define op (read))
(define op2 (read))
(define op3 (read))
(define op4 (read))
(cond
               
)

(if(= op 1)
   (if (= op2 1)
       (if (= op3 1)
           (if (= op4 1)
               ;;;nivel de estudio, genero, numero de personas, estrato
               (let ((band 0))(set! listaPV (query-rows pgc "SELECT `perNumPersonasVivienda` FROM `ciudad` INNER join `persona` p INNER JOIN `consumomensual` on perCedula = comCedula WHERE p.perEstudios = 'Universitario' and p.perSexo = 'Masculino' and p.perNumPersonasVivienda = 2 and p.perEstrato = 3"))(set! listaCM (query-rows pgc "SELECT `comConsumoMensual` FROM `ciudad` INNER join `persona` p INNER JOIN `consumomensual` on perCedula = comCedula WHERE p.perEstudios = 'Universitario' and p.perSexo = 'Masculino' and p.perNumPersonasVivienda = 2 and p.perEstrato = 3")))
               ;;;else op 4
               ;;;nivel de estudio, genero, numero de personas
               (let ((band 0))(set! listaPV (query-rows pgc "SELECT `perNumPersonasVivienda` FROM `ciudad` INNER join `persona` p INNER JOIN `consumomensual` on perCedula = comCedula WHERE p.perEstudios = 'Universitario' and p.perSexo = 'Masculino' and p.perNumPersonasVivienda = 2"))(set! listaCM (query-rows pgc "SELECT `comConsumoMensual` FROM `ciudad` INNER join `persona` p INNER JOIN `consumomensual` on perCedula = comCedula WHERE p.perEstudios = 'Universitario' and p.perSexo = 'Masculino' and p.perNumPersonasVivienda = 2")))
           )
           ;;; else op 3
           (if (= op4 1)
               ;;;nivel de estudio, genero, estrato
               (let ((band 0))(set! listaPV (query-rows pgc "SELECT `perNumPersonasVivienda` FROM `ciudad` INNER join `persona` p INNER JOIN `consumomensual` on perCedula = comCedula WHERE p.perEstudios = 'Universitario' and p.perSexo = 'Masculino' and p.perEstrato = 3"))(set! listaCM (query-rows pgc "SELECT `comConsumoMensual` FROM `ciudad` INNER join `persona` p INNER JOIN `consumomensual` on perCedula = comCedula WHERE p.perEstudios = 'Universitario' and p.perSexo = 'Masculino' and p.perEstrato = 3")))
               ;;; else op 4
               ;;;nivel de estudio, genero
               (let ((band 0))(set! listaPV (query-rows pgc "SELECT `perNumPersonasVivienda` FROM `ciudad` INNER join `persona` p INNER JOIN `consumomensual` on perCedula = comCedula WHERE p.perEstudios = 'Universitario' and p.perSexo = 'Masculino'")) (set! listaCM (query-rows pgc "SELECT `comConsumoMensual` FROM `ciudad` INNER join `persona` p INNER JOIN `consumomensual` on perCedula = comCedula WHERE p.perEstudios = 'Universitario' and p.perSexo = 'Masculino'")))
     
           )
       )
       ;;; else op 2
       (if (= op3 1)
           (if (= op4 1)
               ;;nivel de estudio, numero de personas,estrato
               (let ((band 0))(set! listaPV (query-rows pgc "SELECT `perNumPersonasVivienda` FROM `ciudad` INNER join `persona` p INNER JOIN `consumomensual` on perCedula = comCedula WHERE p.perEstudios = 'Universitario' and p.perNumPersonasVivienda = 2 and p.perEstrato = 3"))(set! listaCM (query-rows pgc "SELECT `comConsumoMensual` FROM `ciudad` INNER join `persona` p INNER JOIN `consumomensual` on perCedula = comCedula WHERE p.perEstudios = 'Universitario' p.perNumPersonasVivienda = 2 and p.perEstrato = 3")))
               ;;; else op 4
               ;;;nivel de estudio, numero de personas
               (let ((band 0))(set! listaPV (query-rows pgc "SELECT `perNumPersonasVivienda` FROM `ciudad` INNER join `persona` p INNER JOIN `consumomensual` on perCedula = comCedula WHERE p.perEstudios = 'Universitario' and p.perNumPersonasVivienda = 2"))(set! listaCM (query-rows pgc "SELECT `comConsumoMensual` FROM `ciudad` INNER join `persona` p INNER JOIN `consumomensual` on perCedula = comCedula WHERE p.perEstudios = 'Universitario' and p.perNumPersonasVivienda = 2")))
           )
           ;;; else op 3
           (if (= op4 1)
               ;;;nivel de estudio, estrato
               (let ((band 0))(set! listaPV (query-rows pgc "SELECT `perNumPersonasVivienda` FROM `ciudad` INNER join `persona` p INNER JOIN `consumomensual` on perCedula = comCedula WHERE p.perEstudios = 'Universitario' and p.perEstrato = 3"))(set! listaCM (query-rows pgc "SELECT `comConsumoMensual` FROM `ciudad` INNER join `persona` p INNER JOIN `consumomensual` on perCedula = comCedula WHERE p.perEstudios = 'Universitario' and p.perEstrato = 3")))
               ;;; else op 4
               ;;;nivel de estudio
               (let ((band 0))(set! listaPV (query-rows pgc "SELECT `perNumPersonasVivienda` FROM `ciudad` INNER join `persona` p INNER JOIN `consumomensual` on perCedula = comCedula WHERE p.perEstudios = 'Universitario'"))(set! listaCM (query-rows pgc "SELECT `comConsumoMensual` FROM `ciudad` INNER join `persona` p INNER JOIN `consumomensual` on perCedula = comCedula WHERE p.perEstudios = 'Universitario'")))
           )
       )
   )
   ;;;else op 1
   (if (= op2 1)
       (if (= op3 1)
           (if (= op4 1)
               ;;; genero, numero de personas, estrato
               (let ((band 0))(set! listaPV (query-rows pgc "SELECT `perNumPersonasVivienda` FROM `ciudad` INNER join `persona` p INNER JOIN `consumomensual` on perCedula = comCedula WHERE p.perSexo = 'Masculino' and p.perNumPersonasVivienda = 2 and p.perEstrato = 3"))(set! listaCM (query-rows pgc "SELECT `comConsumoMensual` FROM `ciudad` INNER join `persona` p INNER JOIN `consumomensual` on perCedula = comCedula WHERE p.perSexo = 'Masculino' and p.perNumPersonasVivienda = 2 and p.perEstrato = 3")))
               ;;; else op 4
               ;;;genero, numero de personas
               (let ((band 0))(set! listaPV (query-rows pgc "SELECT `perNumPersonasVivienda` FROM `ciudad` INNER join `persona` p INNER JOIN `consumomensual` on perCedula = comCedula WHERE p.perSexo = 'Masculino' and p.perNumPersonasVivienda = 2"))(set! listaCM (query-rows pgc "SELECT `comConsumoMensual` FROM `ciudad` INNER join `persona` p INNER JOIN `consumomensual` on perCedula = comCedula WHERE p.perSexo = 'Masculino' and p.perNumPersonasVivienda = 2")))
           )
           ;;; else op 3
           (if (= op4 1)
               ;;;genero, estrato
               (let ((band 0))(set! listaPV (query-rows pgc "SELECT `perNumPersonasVivienda` FROM `ciudad` INNER join `persona` p INNER JOIN `consumomensual` on perCedula = comCedula WHERE p.perSexo = 'Masculino' and p.perEstrato = 3"))(set! listaCM (query-rows pgc "SELECT `comConsumoMensual` FROM `ciudad` INNER join `persona` p INNER JOIN `consumomensual` on perCedula = comCedula WHERE p.perSexo = 'Masculino' and p.perEstrato = 3")))
               ;;; else op 4
               ;;;genero
               (let ((band 0))(set! listaPV (query-rows pgc "SELECT `perNumPersonasVivienda` FROM `ciudad` INNER join `persona` p INNER JOIN `consumomensual` on perCedula = comCedula WHERE p.perSexo = 'Masculino'"))(set! listaCM (query-rows pgc "SELECT `comConsumoMensual` FROM `ciudad` INNER join `persona` p INNER JOIN `consumomensual` on perCedula = comCedula WHERE p.perSexo = 'Masculino'")))
     
           )
       )
       ;;; else op 2
       (if (= op3 1)
           (if (= op4 1)
               ;;;numero de personas, estrato
               (let ((band 0))(set! listaPV (query-rows pgc "SELECT `perNumPersonasVivienda` FROM `ciudad` INNER join `persona` p INNER JOIN `consumomensual` on perCedula = comCedula WHERE p.perNumPersonasVivienda = 2 and p.perEstrato = 3"))(set! listaCM (query-rows pgc "SELECT `comConsumoMensual` FROM `ciudad` INNER join `persona` p INNER JOIN `consumomensual` on perCedula = comCedula WHERE p.perNumPersonasVivienda = 2 and p.perEstrato = 3")))
               ;;; else op 4
               ;;; numero de personas
               (let ((band 0))(set! listaPV (query-rows pgc "SELECT `perNumPersonasVivienda` FROM `ciudad` INNER join `persona` p INNER JOIN `consumomensual` on perCedula = comCedula WHERE p.perNumPersonasVivienda = 2"))(set! listaCM (query-rows pgc "SELECT `comConsumoMensual` FROM `ciudad` INNER join `persona` p INNER JOIN `consumomensual` on perCedula = comCedula WHERE p.perNumPersonasVivienda = 2")))
     
           )
           ;;; else op 3
           (if (= op4 1)
               ;;;estrato
               (let ((band 0))(set! listaPV (query-rows pgc "SELECT `perNumPersonasVivienda` FROM `ciudad` INNER join `persona` p INNER JOIN `consumomensual` on perCedula = comCedula WHERE p.perEstrato = 3"))(set! listaCM (query-rows pgc "SELECT `comConsumoMensual` FROM `ciudad` INNER join `persona` p INNER JOIN `consumomensual` on perCedula = comCedula WHERE p.perEstrato = 3")))
               ;;; else op 4
               (display "Debe elegir al menos una opción.")
           )
       )
   )
)

;;;Media
(define sumaMe 0)
(define (sumaMedia valor)
  (set! sumaMe (+ valor sumaMe))
)
(let loop ((l listaCM) (r listaPV)) 
   (cond ((null? l) #f)
         (else
           (sumaMedia (* (vector->values(first l)) (vector->values(first r))) )
           (loop (rest l)(rest r)))))


(define media (/ sumaMe (length listaCM)))
(display media)

;;;Varianza
(define Varianza 0)
(define (sumaValores valor)
  (set! Varianza (+ valor Varianza))
)
(let loop ((l listaCM) (r listaPV)) 
   (cond ((null? l) #f)
         (else
           (sumaValores (/ (expt (- (* (vector->values(first l)) (vector->values(first r))) media) 2) (- (length listaCM) 1)))
           (loop (rest l)(rest r)))))
(displayln Varianza)

;;;Desviación Estandar
(define DesEstandar (sqrt Varianza))
(displayln DesEstandar)
#lang racket
(require db)

(define pgc
(mysql-connect   #:server "localhost"
                 #:port 3306
                 #:database "AquaBot"
                 #:user "root"
                 ))
;;;PROMEDIO ANUAL

(define cedEntrada (read))
(define listPerV (query-rows pgc (string-append "SELECT `perNumPersonasVivienda` FROM `ciudad` INNER join `persona` p INNER JOIN `consumomensual` on perCedula = comCedula WHERE ciuNombre = perCiudad and p.perCedula = " (number->string cedEntrada) "")))
;(query-rows pgc "SELECT `perNumPersonasVivienda`,`comConsumoMensual` FROM `ciudad` INNER join `persona` INNER JOIN `consumomensual` on perCedula = comCedula WHERE ciuNombre = perCiudad")
(define listConM (query-rows pgc (string-append "SELECT `comConsumoMensual` FROM `ciudad` INNER join `persona` p INNER JOIN `consumomensual` on perCedula = comCedula WHERE ciuNombre = ciuNombre and p.perCedula= " (number->string cedEntrada) "")))
(define sumC 0)

(define (suma valor)
  (set! sumC (+ valor sumC))
  )
  
(let loop ((l listConM) (r listPerV)) 
   (cond ((null? l) #f)
         (else
           (suma (* (vector->values(first l)) (vector->values(first r))))
           (loop (rest l)(rest r)))))


(define promEmpirico
  (printf "El promedio de todas las personas es: ~s" (/ sumC (length listPerV)))
           )

;Calculo por genero

(define listGeneroN (query-rows pgc "SELECT `perNumPersonasVivienda` FROM `ciudad` INNER join `persona` p INNER JOIN `consumomensual` on perCedula = comCedula WHERE p.perSexo = 'Masculino' and p.perCedula=123 GROUP BY perCedula"))
;(query-rows pgc "SELECT `perNumPersonasVivienda`,`comConsumoMensual` FROM `ciudad` INNER join `persona` INNER JOIN `consumomensual` on perCedula = comCedula WHERE ciuNombre = perCiudad")
(define listGeneroC (query-rows pgc "SELECT `comConsumoMensual` FROM `ciudad` INNER join `persona` p INNER JOIN `consumomensual` on perCedula = comCedula WHERE p.perSexo = 'Masculino' and p.perCedula=123 GROUP BY perCedula"))

(define sumG 0)
(define (sumag valor)
  (set! sumG (+ valor sumG))
  )
(let loop ((l listGeneroC ) (r listGeneroN)) 
   (cond ((null? l) #f)
         (else
           (sumag (* (vector->values(first l)) (vector->values(first r))))
           (loop (rest l)(rest r)))))

(define promHombres
  (printf "El promedio de las personas de genero es: ~s" (/ sumG (length listGeneroC)))
           )

;
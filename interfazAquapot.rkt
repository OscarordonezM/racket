#lang racket
(require racket/gui)

;=============================VENTANA PRINCIPAL===========================

(define ventana (new frame%
                     [label "AQUABOT"]
                     [width 400]
                     [height 100]
                     ))
(define datos (new message%
                     [parent ventana]
                     [label ""]
                     [auto-resize #t]
                     ))

(define panel-botones-ventana (new horizontal-pane% [parent ventana]))
(define botonSeleccionar (new button%
                              [parent panel-botones-ventana]
                              [label "SELECCIONAR USUARIO"]
                              [callback (lambda (b c)
                                          (send ventana-seleccionar show #t))]))

(define boton-Registrar
  (new button%
       [parent panel-botones-ventana]
       [label "REGISTRAR USUARIO"]
       [callback
        (lambda (b c)
          (send ventana-registro show #t)
          )
        ])

  )
;===========================VENTANA REGISTRO=============================
(define ventana-registro (new dialog%
                              [label "REGISTRO USUARIO"]))
;(define panel-registro (new vertical-pane%) [parent ventana-registro])

(define txt-nombre (new text-field%
                         [label "Nombre :"]
                         [parent ventana-registro]
                         ))

(define txt-apellido (new text-field%
                          [label "Apellido :"]
                          [parent ventana-registro]
                          ))

(define txt-fechaNacimiento (new text-field%
                          [label "Fecha Nacimiento :"]
                          [parent ventana-registro]
                          ))
(define (Genero r c)
  (send mensaje set-label
        (string-append "se marco la opcion"
                       (number->string (send r get-selection))
                       "con texto"
                       (send r get-item-label (send r get-selection))
                       "del grupo"
                       (let ([t (send r get-label)])
                         (if t t "<sin-text>"))
                       "'"))
  )

(define radio-Genero (new radio-box%
                    [label "Genero "]
                    [parent ventana-registro]
                    [choices (list "Masculino" "Femenino")]
                    [callback Genero]
                    ))



(define (nivelEstudio r c)
  (send mensaje set-label
        (string-append "opcion lista"
                       (number->string (send r get-selection))
                       "con texto"
                       (send r get-string-selection)
                       "de la lista"
                       (let ([t (send r get-label)])
                         (if t t "<sin-texto>"))
                       "'"
                       ))
  )

(define choice-nivelEstudio (new choice%
                          [label "Nivel eduacion "]
                          [choices (list "basica" "secundaria" "superior")]
                          [parent ventana-registro]
                          [callback nivelEstudio]))

(define (Estrato r c)     ;instancia la lista y control-evento
  (send mensaje set-label
        (string-append "opcion lista"
                       (number->string (send r get-selection))
                       "con texto"
                       (send r get-string-selection)
                       "de la lista"
                       (let ([t (send r get-label)])
                         (if t t "<sin-texto>"))
                       "'"
                       ))
  )

(define choice-estrato (new choice%
                      [label "Estrato "]
                      [choices (list "1" "2" "3" "4" "5" "6")]
                      [parent ventana-registro]
                      [callback Estrato]
                      ))

(define botonRegistrar(new button%
                           [parent ventana-registro]
                           [label "REGISTRAR"]
                           [callback (lambda ( b c)
                                       (send ventana-registro show #t))]))

;============================VENTANA SELECCIONAR USUARIO=================

(define ventana-seleccionar (new dialog%
                                 [label "SELECCIONAR USUARIO"]))

(define panel-opciones-horizontal (new horizontal-pane% [parent ventana-seleccionar]))
(define panel-opciones-vertical (new vertical-pane% [parent ventana-seleccionar]))
(define (usuario r c)     ;instancia la lista y control-evento
  (send mensaje set-label
        (string-append "opcion lista"
                       (number->string (send r get-selection))
                       "con texto"
                       (send r get-string-selection)
                       "de la lista"
                       (let ([t (send r get-label)])
                         (if t t "<sin-texto>"))
                       "'"
                       ))
  )
(define choice-seleccionar-usuario (new choice%
                      [label "Usuario"]
                      [choices (list "usuario 1" "usuario 2")]
                      [parent panel-opciones-horizontal]
                      [callback usuario]
                      ))

(define botonMostrar (new button%
                          [parent panel-opciones-horizontal]
                          [label "MOSTRAR"]
                          [callback (lambda (b c)
                                      (send ventana-registro show #t))]));llamar mostrar informacion pendiente
(define botonGenerarRecibo (new button%
                                [parent panel-opciones-vertical]
                                [label "GENERAR RECIBO"]
                                [callback (lambda (b c)
                                            (send ventana-registro show #t))]) );llamar generar recibo pendiente
(define botonCalcular (new button%
                           [parent panel-opciones-vertical]
                           [label "CALCULAR"]
                           [callback (lambda (b c)
                                       (send ventana-registro show #t))])); llamar a calcular PENDIENTE!!!
(define ventana-calcular (new dialog%
                              [label "CALCULAR"]))

(define ventana-recibo (new dialog%
                            [label "RECIBO"]))








(define mensaje (new message%
                     [label ""]
                     [parent ventana]
                     [auto-resize #t]
                     ))




#|(define panel (new horizontal-panel% [parent ventana]))
(new button% [parent ventana-registro]
     [label "INSERTAR USUARIO"]
     [callback (lambda (button event)
                 (send mensaje set-label ""))])
|#

#|(new button% [parent panel]
     [label "SELECCIONAR USUARIO"]
     [callback (lambda (button event)
                 (send mensaje set-label ""))])
|#

(send ventana show #t)

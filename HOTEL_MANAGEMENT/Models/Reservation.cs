
//------------------------------------------------------------------------------
// <auto-generated>
//     Ce code a été généré à partir d'un modèle.
//
//     Des modifications manuelles apportées à ce fichier peuvent conduire à un comportement inattendu de votre application.
//     Les modifications manuelles apportées à ce fichier sont remplacées si le code est régénéré.
// </auto-generated>
//------------------------------------------------------------------------------


namespace HOTEL_MANAGEMENT.Models
{

using System;
    using System.Collections.Generic;
    
public partial class Reservation
{

    public int Id_Reservation { get; set; }

    public System.DateTime Date_Begin { get; set; }

    public System.DateTime Date_End { get; set; }

    public System.DateTime Date_Reservation { get; set; }

    public double Bill { get; set; }

    public int Id_user { get; set; }

    public int Id_Room { get; set; }



    public virtual Room Room { get; set; }

    public virtual User User { get; set; }

}

}

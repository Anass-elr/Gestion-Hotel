
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
    
public partial class Comment
{

    public int Id_Comment { get; set; }

    public bool Opinion { get; set; }

    public string Comment1 { get; set; }

    public System.DateTime Date_Comment { get; set; }

    public int Id_user { get; set; }

    public int Id_Hotel { get; set; }



    public virtual Hotel Hotel { get; set; }

    public virtual User User { get; set; }

}

}
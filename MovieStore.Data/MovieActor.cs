//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MovieStore.Data
{
    using System;
    using System.Collections.Generic;
    
    public partial class MovieActor
    {
        public int MOVIE_ID { get; set; }
        public int ACTOR_ID { get; set; }
        public System.DateTime DATE_CREATED { get; set; }
    
        public virtual Actor Actor { get; set; }
        public virtual Movie Movie { get; set; }
    }
}

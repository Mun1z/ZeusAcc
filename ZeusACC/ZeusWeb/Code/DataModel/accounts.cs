//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ZeusWeb.Code.DataModel
{
    using System;
    using System.Collections.Generic;
    
    public partial class accounts
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public accounts()
        {
            this.account_viplist = new HashSet<account_viplist>();
            this.players = new HashSet<players>();
        }
    
        public int ID { get; set; }
        public string NAME { get; set; }
        public string PASSWORD { get; set; }
        public int PREMDAYS { get; set; }
        public long LASTDAY { get; set; }
        public string EMAIL { get; set; }
        public string KEY { get; set; }
        public bool BLOKED { get; set; }
        public int WARNINGS { get; set; }
        public int GROUPID { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<account_viplist> account_viplist { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<players> players { get; set; }
    }
}

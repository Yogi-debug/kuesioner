using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BPRSB.Kuesioner.Library.Models
{
    public class User
    {
        public int UserId { get; set; }
        public bool Active { get; set; }
        public string LoginId { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }
        public bool IsAdmin{ get; set; }
    }

}

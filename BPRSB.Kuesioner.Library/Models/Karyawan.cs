using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BPRSB.Kuesioner.Library.Models
{
    public class Karyawan
    {
        public int KaryawanId { get; set; }
        public bool Active { get; set; }
        public string NomorKaryawan { get; set; }
        public string Nama { get; set; }
        public string Jabatan { get; set; }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    class E_usuario
    {
        public int u_cod_usuario { set; get; }
        public string p_ci { set; get; }
        public string u_password { set; get; }
        public int tp_cod_tipo { get; set; }
    }
}

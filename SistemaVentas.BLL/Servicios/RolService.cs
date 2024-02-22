using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using AutoMapper;
using SistemaVenta.BLL.Servicios.Contrato;
using SistemaVenta.DAL.Repositorios.Contrato;
using SistemaVenta.DTO;
using SistemaVenta.Model;

namespace SistemaVenta.BLL.Servicios
{
    public class RolService :IRolService
    {
        private readonly IGenericRepository<Rol> _rolRespositorio;
        private readonly IMapper _mapper;

        public RolService(IGenericRepository<Rol> rolRespositorio, IMapper mapper)
        {
            _rolRespositorio = rolRespositorio;
            _mapper = mapper;
        }

        public async Task<List<RolDTO>> Lista()
        {
            try
            {
                var listaRoles = await _rolRespositorio.Consultar();
                return _mapper.Map<List<RolDTO>>(listaRoles.ToList());
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}

package domain.service;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;

import java.sql.SQLIntegrityConstraintViolationException;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.security.test.context.support.WithUserDetails;
import org.springframework.test.context.jdbc.Sql;

import com.eits.desafio.domain.entity.Usuario;
import com.eits.desafio.domain.repository.IUsuariosRepository;
import com.eits.desafio.domain.service.UsuarioService;

import application.config.IntegrationTests;

@Sql("dataset/usuarios.sql")
public class UsuarioServiceTest extends IntegrationTests
{
	@Autowired
	private UsuarioService usuarioService;
	
	@Autowired
	private IUsuariosRepository usuarioRepository;
	
	@WithUserDetails("wagner.mattei@eits.com.br")
	@Test
	@Sql({
		"dataset/usuarios.sql"
	})
	
	//teste de inserir usuario
	public void insertUsuarioMustPass() 
	{
		Usuario usuario = new Usuario();
		usuario.setNome("teste");
		usuario.setCpf("00032112396");
		usuario.setEmail("sdfasdf@dfdasfasd.com");
		usuario.setSenha("1234");
		usuario.setConfirmSenha("1234");
		usuarioService.insert(usuario);
		
		Page<Usuario> users = usuarioService.listUsuariosByFilters("shdfsadhf", 0, 5, "nome", "ASC");
		Assert.assertEquals(users.getContent().get(0).getNome(), "shdfsadhf");
	}
	
	//teste de edtar usuario
	@WithUserDetails("wagner.mattei@eits.com.br")
	@Test
	@Sql({
		"dataset/usuarios.sql"
	})
	public void updateUsuarioMustPass()
	{
		Usuario usuario = usuarioRepository.findOne(new Long(2));
		usuario.setNome("Wagner");
		usuarioService.update(usuario);
				
	}
	
	//teste de finById
	@Test
	@Sql({
		"dataset/usuarios.sql"
	})
	public void finByIdMustPass()
	{
		Usuario usuario = usuarioService.findById(new Long(2));
		assertNotNull(usuario);
	}
	
	//teste de updateUsuarioToStatus
	@WithUserDetails("wagner.mattei@eits.com.br")
	@Test
	@Sql({
		"dataset/usuarios.sql"
	})
	public void updateUsuarioToStatusMustPass()
	{
		Usuario usuario = usuarioRepository.findOne(new Long(2));
		usuarioService.updateUsuarioToStatus(usuario);
	}
	
	//casos MustFail
	@Test()
	@Sql({
		"dataset/usuarios.sql"
	})
	public void findByIdMustFail()
	{
		Usuario usuario = usuarioService.findById(new Long(8));
		assertNull(usuario);
		
	}
	
	//teste de insertMustFail
	@Test(expected = SQLIntegrityConstraintViolationException.class)
	@Sql({
		"dataset/usuarios.sql"
	})
	public void insertMustFail()
	{
		Usuario usuario = new Usuario();
		usuario.setNome("teste");
		usuario.setCpf("02542322058");
		usuario.setEmail("wagner.mattei@eits.com.br");
		usuario.setSenha("1234");
		usuario.setConfirmSenha("1234");
		usuarioService.insert(usuario);
	}
	
	
	
}

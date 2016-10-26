<%@page import="modelo.Equipe"%>
<%@page import="dao.EquipeDAO"%>
<%@page import="modelo.Heroi"%>
<%@page import="dao.HeroiDAO"%>
<%@page import="modelo.Editora"%>
<%@page import="dao.EditoraDAO"%>
<%@page import="modelo.Categoria"%>
<%@page import="java.util.List"%>
<%@page import="dao.CategoriaDAO"%> 
<!DOCTYPE HTML>
<%
    EquipeDAO eedao = new EquipeDAO();
    List<Equipe> eelista = eedao.listar();

    CategoriaDAO cdao = new CategoriaDAO();
    List<Categoria> clista = cdao.listar();

    EditoraDAO edao = new EditoraDAO();
    List<Editora> elista = edao.listar();

    HeroiDAO hdao = new HeroiDAO();
    List<Heroi> hlista;

    Equipe name = new Equipe();

    EquipeDAO dao = new EquipeDAO();
    List<Equipe> lista;
    if (request.getParameter("txtFiltro") != null) {
        lista = dao.listar(request.getParameter("txtFiltro"));
    } else {
        //Chama o m�todo que retorna 
        //todos os registros do Banco de Dados
        lista = dao.listar();
    }
%>
<html>
    <head>
        <title>Equipes - Sistema Her�is</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
        <link rel="stylesheet" href="assets/css/main.css" />
        <!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
        <!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
    </head>
    <body>
        <!-- Page Wrapper -->
        <div id="page-wrapper">
            <!-- Header -->
            <header id="header">
                <h1><a href="index.jsp">Sistema Her�is</a></h1>
                <nav id="nav">
                    <ul>
                        <li class="special">
                            <a href="#menu" class="menuToggle"><span>Menu</span></a>
                            <div id="menu">
                                <ul>
                                    <li><a href="index.jsp">Home</a></li>
                                        <%
                                            for (Categoria c : clista) {
                                        %>
                                    <li><a value="txtFiltro" href="heroi_vilao_list.jsp?categoria=<%=c.getCodigo()%>"><%=c.getNome()%></a></li>
                                        <%
                                            }
                                        %>
                                        <%
                                            for (Editora e : elista) {
                                        %>
                                    <li><a href="dc_marvel_list.jsp?editora=<%=e.getCodigo()%>"><%=e.getNome()%></a></li>
                                        <%
                                            }
                                        %>
                                    <li><a href="baralho.jsp">Baralho</a></li>
                                    <li><a href="jogador_list.jsp">Jogadores</a></li>
                                    <li><a href="equipe_list.jsp">Equipes</a></li>
                                </ul>
                            </div>
                        </li>
                    </ul>
                </nav>
            </header>
            <!-- Main -->
            <article id="main">
                <section class="wrapper style5">
                    <div class="inner">	
                        <section>

                            <%
                                for (Equipe item : lista) {
                            %>



                            <div>
                                <h2><%=item.getNome()%></h2>   
                                
                            </div>



                            <%
                                for (Heroi hero : item.getHeroiList()) {
                            %>
                            <h4><%=hero.getNome()%></h4>
                            <h2><img src ="../fotos/<%=hero.getFoto()%>" width="200" height="150"/></h2>
                            <br/>
                            <p> Codinome: <strong> <%=hero.getCodinome()%> </strong><br/>
                                Intelig�ncia: <strong> <%=hero.getInteligencia()%> </strong><br/>
                                Velocidade: <strong> <%=hero.getVelocidade()%> </strong><br/>
                                Resist�ncia: <strong> <%=hero.getResistencia()%> </strong><br/>
                                For�a: <strong> <%=hero.getForca()%> </strong><br/>
                                Proje��o de Energia: <strong> <%=hero.getProjecaoenergia()%> </strong><br/>
                                Habilidade em Combate: <strong> <%=hero.getHabilidadecombate()%> </strong><br/>
                                Categoria: <strong> <%=hero.getCategoria().getNome()%> </strong><br/>
                                Editora:<strong> <%=hero.getEditora().getNome()%></strong><br/>
                                Regi�o: <strong> <%=hero.getRegiao().getNome()%> </strong><br/>
                            </p>                    
                            <%
                                }
                            %>
                            <%
                                }
                            %>

                        </section>


                        <div class="row">
                            <div class="6u 12u$(medium)">
                                <ul class="alt">

                                    <section>
                                        <div class="row">
                                            <div class="6u 12u$(medium)">
                                                <ul class="alt">

                                                </ul>
                                            </div>
                                        </div>
                                    </section>

                                </ul>
                            </div>
                        </div>
                </section>
            </article>
            <!-- Footer -->
            <footer id="footer">
                <ul class="icons">
                    <li><a href="https://twitter.com/Argentinossauro" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
                    <li><a href="https://www.facebook.com/nintendolizard" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
                    <li><a href="https://www.instagram.com/jorfer07/" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
                    <li><a href="https://dribbble.com/Argentinossauro" class="icon fa-dribbble"><span class="label">Dribbble</span></a></li>
                    <li><a href="nando.n9@hotmail.com.br" class="icon fa-envelope-o"><span class="label">Email</span></a></li>
                </ul>
                <ul class="copyright">
                    <li>&copy; Sistema Her�is</li><li>Design: <a href="http://siqueirajorge.blogspot.com">Jorge Siqueira</a></li>
                </ul>
            </footer>
        </div>
        <!-- Scripts -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/jquery.scrollex.min.js"></script>
        <script src="assets/js/jquery.scrolly.min.js"></script>
        <script src="assets/js/skel.min.js"></script>
        <script src="assets/js/util.js"></script>
        <!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
        <script src="assets/js/main.js"></script>
    </body>
</html>
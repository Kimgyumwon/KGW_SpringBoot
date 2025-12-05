<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
    		                <!-- Topbar -->
               	<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                    <!-- Topbar Search -->
                    <form
                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group">
                            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                                aria-label="Search" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="button">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div>
                        </div>
                    </form>

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <li class="nav-item dropdown no-arrow d-sm-none">
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                aria-labelledby="searchDropdown">
                                <form class="form-inline mr-auto w-100 navbar-search">
                                    <div class="input-group">
                                        <input type="text" class="form-control bg-light border-0 small"
                                            placeholder="Search for..." aria-label="Search"
                                            aria-describedby="basic-addon2">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button">
                                                <i class="fas fa-search fa-sm"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>
                        
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="localeDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-globe-asia" style="color: #4b4be6"></i>
                                <!-- Counter - Alerts -->
                            </a>
                            <!-- Dropdown - Alerts -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="localeDropdown">
                                <a class="dropdown-item d-flex align-items-center" href="?lang=ko">
                                    <div>
                                        <span class="font-weight-bold">Korea</span>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="?lang=en">
                                    <div>
                                        <span class="font-weight-bold">English</span>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="?lang=jp">
                                    <div>
                                        <span class="font-weight-bold">Japan</span>
                                    </div>
                                </a>
                            </div>
                        </li>
					<c:if test="${not empty user}">
                        <li class="nav-item mx-1">
                            <a class="nav-link" href="/users/detail?${user.username}" id="alertsDropdown" role="button"
                                aria-haspopup="true" aria-expanded="false">
							<i class="fas fa-fish" style="color: #6aab97"></i>                      
							</a>
                        </li>
					</c:if>
					<c:if test="${empty user}">
                        <li class="nav-item mx-1">
                            <a class="nav-link" href="/users/login" id="alertsDropdown" role="button"
                                aria-haspopup="true" aria-expanded="false">
							<i class="fas fa-dragon" style="color: #ff6060"></i>                           
							</a>
                         </li>
                         <li class="nav-item mx-1">
                            <a class="nav-link" href="/users/register" id="alertsDropdown" role="button"
                                aria-haspopup="true" aria-expanded="false">
								<i class="fas fa-skull" style="color: #288a28"></i>
							</a>
                         </li>
					</c:if>
                    </ul>

                </nav>
                <!-- End of Topbar -->
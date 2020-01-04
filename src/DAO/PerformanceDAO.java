package DAO;

import java.sql.*;
import java.util.Vector;

import DTO.OpenPerformanceDTO;
import DTO.PerformanceDTO;
import DTO.StageExhibitionDTO;
import DTO.StagePerformanceDTO;
import main.DB;

public class PerformanceDAO {
	//TODO: 이게 만약안되면 =null 해주기!!!
	private DB getCon;
	private Connection conn;
	//private Statement stmt;
	private PreparedStatement psmt;
	private Statement stmt;
	private ResultSet rs;	//안돌아가면 null

	private void connect() {
		this.conn = this.getCon.loadConnection();
	}

	// 전체 공연 조회
	public Vector<PerformanceDTO> totalInquiryPerformance() {
		connect();
		Vector<PerformanceDTO> pfList = new Vector<PerformanceDTO>();
		PerformanceDTO pf;
		try {

			String sql = "select * from performance";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while(rs.next()) {
				pf = new PerformanceDTO();
				pf.setName(rs.getString("name"));
				pf.setTime(rs.getInt("time"));
				pf.setType(rs.getString("type"));
				pfList.addElement(pf);
			}
			return pfList;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {if(rs!=null) rs.close();}catch(Exception e){}
			try {if(psmt!=null) psmt.close();} catch(Exception e) {}
			try {if(conn!=null) conn.close();} catch(Exception e) {}
		}
		return null;
	}
	public OpenPerformanceDTO inquiryPerformanceOP(String name) {//////////////////////////
		connect();
		OpenPerformanceDTO pf = new OpenPerformanceDTO();
		try {
			String sql = "select * from open_performance where name = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, name);
			rs = psmt.executeQuery();

			rs.next();
			pf.setOpened(rs.getInt("opened"));

			return pf;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {if(psmt!=null) psmt.close();} catch(Exception e) {}
			try {if(conn!=null) conn.close();} catch(Exception e) {}
		}
		return null;
	}
	
	// 변경전,후 - 공연조회
	public PerformanceDTO inquiryPerformance(String name) {
		connect();
		PerformanceDTO pf = new PerformanceDTO();
		try {
			String sql = "select * from performance where name = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, name);
			rs = psmt.executeQuery();

			rs.next();
			pf.setName(rs.getString("name"));
			pf.setTime(rs.getInt("time"));
			pf.setType(rs.getString("type"));

			return pf;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {if(psmt!=null) psmt.close();} catch(Exception e) {}
			try {if(conn!=null) conn.close();} catch(Exception e) {}
		}
		return null;
	}
	// 공연장 이름 중복 체크
	public boolean checkSPName(String name) {	//공연장 등록 중복체크
		connect();
		try {
			String sql = "select * from performance_stage where place = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, name);
			rs = psmt.executeQuery();

			if(rs.next()) return true;	//중복일 경우 true반환

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {if(rs!=null) rs.close();} catch(Exception e) {}
			try {if(psmt!=null) psmt.close();} catch(Exception e) {}
			try {if(conn!=null) conn.close();} catch(Exception e) {}
		}
		return false;//중복이지 않을 경우 false반환
	}
	// 공연장 이름 중복 체크2
	public boolean checkSPName2(String name) {	//공연장 수정,삭제 중복체크
		connect();
		try {
			String sql = "select * from performance_stage where place = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, name);
			rs = psmt.executeQuery();

			if(!rs.next()) return true;	//중복이 아닐 경우 true반환

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {if(rs!=null) rs.close();} catch(Exception e) {}
			try {if(psmt!=null) psmt.close();} catch(Exception e) {}
			try {if(conn!=null) conn.close();} catch(Exception e) {}
		}
		return false;//중복이지 않을 경우 false반환
	}



	// 공연 - 이름 수정
	public boolean updateName(String name, String originalName) {
		connect();
		try {
			String sql = "update performance set name = ? where name = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, name);
			psmt.setString(2, originalName);
			int check = psmt.executeUpdate();

			if(check == 1) return true;
			else return false;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {if(psmt!=null) psmt.close();} catch(Exception e) {}
			try {if(conn!=null) conn.close();} catch(Exception e) {}
		}
		return false;
	}
	
	// 공연 - 공연유형 수정
		public boolean updateAll(String type, int time, String name) {
			connect();
			try {
				String sql = "update performance set type = ?, time = ? where name = ?";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, type);
				psmt.setInt(2, time);
				psmt.setString(3, name);
				int check = psmt.executeUpdate();

				if(check == 1) return true;
				else return false;
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {if(psmt!=null) psmt.close();} catch(Exception e) {}
				try {if(conn!=null) conn.close();} catch(Exception e) {}
			}
			return false;
		}

	// 공연 - 공연유형 수정
	public boolean updateType(String type, String name) {
		connect();
		try {
			String sql = "update performance set type = ? where name = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, type);
			psmt.setString(2, name);
			int check = psmt.executeUpdate();

			if(check == 1) return true;
			else return false;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {if(psmt!=null) psmt.close();} catch(Exception e) {}
			try {if(conn!=null) conn.close();} catch(Exception e) {}
		}
		return false;
	}

	// 공연 - 공연시간 수정
	public boolean updateTime(int time, String name) {
		connect();
		try {
			String sql = "update performance set time = ? where name = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, time);
			psmt.setString(2, name);
			int check = psmt.executeUpdate();

			if(check == 1) return true;
			else return false;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {if(psmt!=null) psmt.close();} catch(Exception e) {}
			try {if(conn!=null) conn.close();} catch(Exception e) {}
		}
		return false;
	}
	// 공연삭제 op 포함
		public boolean deletePerformanceWithOP(String name) {
			connect();
			try {
				String sql = "delete from performance where name = ?";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, name);
				int check = psmt.executeUpdate();
				
				sql = "delete from open_performance where name = ?";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, name);
				check = psmt.executeUpdate();

				if(check == 1) return true;
				else return false;
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {if(psmt!=null) psmt.close();} catch(Exception e) {}
				try {if(conn!=null) conn.close();} catch(Exception e) {}
			}
			return false;
		}
	
	// 공연삭제
	public boolean deletePerformance(String name) {
		connect();
		try {
			String sql = "delete from performance where name = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, name);
			int check = psmt.executeUpdate();

			if(check == 1) return true;
			else return false;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {if(psmt!=null) psmt.close();} catch(Exception e) {}
			try {if(conn!=null) conn.close();} catch(Exception e) {}
		}
		return false;
	}

	// 전체 공연등록 조회
	public Vector<OpenPerformanceDTO> totalInquiryOpenPerformance() {
		connect();
		Vector<OpenPerformanceDTO> opfList = new Vector<OpenPerformanceDTO>();
		OpenPerformanceDTO opf;
		try {

			String sql = "select * from open_performance";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while(rs.next()) {
				opf = new OpenPerformanceDTO();
				opf.setPno(rs.getInt("pno"));
				opf.setName(rs.getString("name"));
				opf.setPlace(rs.getString("place"));
				opf.setSdate(rs.getString("sdate"));
				opf.setEdate(rs.getString("edate"));
				opf.setStime(rs.getString("stime"));
				opf.setPriceSeatR(rs.getInt("priceSeatR"));
				opf.setPriceSeatS(rs.getInt("priceSeatS"));
				opf.setPriceSeatA(rs.getInt("priceSeatA"));
				opf.setId(rs.getString("id"));
				opf.setOpened(rs.getInt("opened"));

				opfList.addElement(opf);
			}
			return opfList;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {if(rs!=null) rs.close();}catch(Exception e){}
			try {if(psmt!=null) psmt.close();} catch(Exception e) {}
			try {if(conn!=null) conn.close();} catch(Exception e) {}
		}
		return null;
	}

	// 관리자 공연등록 조회
	public OpenPerformanceDTO aaadminInquiryOpenPerformance(String admin) {
		connect();
		OpenPerformanceDTO opf = new OpenPerformanceDTO();
		try {
			String sql = "select * from open_performance where admin = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, admin);
			rs = psmt.executeQuery();

			rs.next();
			opf.setPno(rs.getInt("pno"));
			opf.setSdate(rs.getString("sdate"));
			opf.setEdate(rs.getString("edate"));
			opf.setStime(rs.getString("stime"));
			opf.setPriceSeatR(rs.getInt("priceSeatR"));
			opf.setPriceSeatS(rs.getInt("priceSeatS"));
			opf.setPriceSeatA(rs.getInt("priceSeatA"));
			opf.setId(rs.getString("id"));			

			return opf;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {if(psmt!=null) psmt.close();} catch(Exception e) {}
			try {if(conn!=null) conn.close();} catch(Exception e) {}
		}
		return null;
	}


	// 개시공연 삭제
		public boolean deleteOpenPerformance(String name) {
			connect();
			try {
				String sql = "delete from open_performance where name = ?";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, name);
				int check = psmt.executeUpdate();

				if(check == 1) return true;
				else return false;
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {if(psmt!=null) psmt.close();} catch(Exception e) {}
				try {if(conn!=null) conn.close();} catch(Exception e) {}
			}
			return false;
		}

	// 개시공연 삭제
	public boolean deleteOpenPerformance(int pno) {
		connect();
		try {
			String sql = "delete from open_performance where pno = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, pno);
			int check = psmt.executeUpdate();

			if(check == 1) return true;
			else return false;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {if(psmt!=null) psmt.close();} catch(Exception e) {}
			try {if(conn!=null) conn.close();} catch(Exception e) {}
		}
		return false;
	}


	// 개시공연 - 시작날짜 수정
	public boolean updateSdate(String sdate, int pno) {
		connect();
		try {
			String sql = "update open_performance set sdate = ? where pno = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, sdate);
			psmt.setInt(2, pno);
			int check = psmt.executeUpdate();

			if(check == 1) return true;
			else return false;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {if(psmt!=null) psmt.close();} catch(Exception e) {}
			try {if(conn!=null) conn.close();} catch(Exception e) {}
		}
		return false;
	}


	// 개시공연 - 끝나는날짜 수정
	public boolean updateEdate(String edate, int pno) {
		connect();
		try {
			String sql = "update open_performance set edate = ? where pno = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, edate);
			psmt.setInt(2, pno);
			int check = psmt.executeUpdate();

			if(check == 1) return true;
			else return false;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {if(psmt!=null) psmt.close();} catch(Exception e) {}
			try {if(conn!=null) conn.close();} catch(Exception e) {}
		}
		return false;
	}

	// 개시공연 - 시작시간 수정
	public boolean updateStime(String stime, int pno) {
		connect();
		try {
			String sql = "update open_performance set stime = ? where pno = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, stime);
			psmt.setInt(2, pno);
			int check = psmt.executeUpdate();

			if(check == 1) return true;
			else return false;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {if(psmt!=null) psmt.close();} catch(Exception e) {}
			try {if(conn!=null) conn.close();} catch(Exception e) {}
		}
		return false;
	}

	// 개시공연 - R석가격 수정
	public boolean updatePriceSeatR(int priceSeatR, int pno) {
		connect();
		try {
			String sql = "update open_performance set priceSeatR = ? where pno = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, priceSeatR);
			psmt.setInt(2, pno);
			int check = psmt.executeUpdate();

			if(check == 1) return true;
			else return false;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {if(psmt!=null) psmt.close();} catch(Exception e) {}
			try {if(conn!=null) conn.close();} catch(Exception e) {}
		}
		return false;
	}

	// 개시공연 - S석가격 수정
	public boolean updatePriceSeatS(int priceSeatS, int pno) {
		connect();
		try {
			String sql = "update open_performance set priceSeatS = ? where pno = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, priceSeatS);
			psmt.setInt(2, pno);
			int check = psmt.executeUpdate();

			if(check == 1) return true;
			else return false;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {if(psmt!=null) psmt.close();} catch(Exception e) {}
			try {if(conn!=null) conn.close();} catch(Exception e) {}
		}
		return false;
	}

	// 개시공연 - A석가격 수정
	public boolean updatePriceSeatA(int priceSeatA, int pno) {
		connect();
		try {
			String sql = "update open_performance set priceSeatA = ? where pno = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, priceSeatA);
			psmt.setInt(2, pno);
			int check = psmt.executeUpdate();

			if(check == 1) return true;
			else return false;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {if(psmt!=null) psmt.close();} catch(Exception e) {}
			try {if(conn!=null) conn.close();} catch(Exception e) {}
		}
		return false;
	}
	
	//개시 승인
	public boolean updateOpened(int pno) {
		connect();
		try {
			String sql = "update open_performance set opened = ? where pno = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, 1);
			psmt.setInt(2, pno);
			int check = psmt.executeUpdate();

			if(check == 1) return true;
			else return false;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {if(psmt!=null) psmt.close();} catch(Exception e) {}
			try {if(conn!=null) conn.close();} catch(Exception e) {}
		}
		return false;
	}
	//개시 취소
		public boolean updateOpened2(int pno) {
			connect();
			try {
				String sql = "update open_performance set opened = ? where pno = ?";
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, 2);
				psmt.setInt(2, pno);
				int check = psmt.executeUpdate();

				if(check == 1) return true;
				else return false;
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {if(psmt!=null) psmt.close();} catch(Exception e) {}
				try {if(conn!=null) conn.close();} catch(Exception e) {}
			}
			return false;
		}





	/* 공연장 추가 */
	public boolean StagePerformanceAdd(StagePerformanceDTO stageperfomance) {
		connect();
		try {
			String sql = "insert into performance_stage values(?,?,?,?);";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, stageperfomance.getPlace());
			psmt.setInt(2, stageperfomance.getSeatOfR());
			psmt.setInt(3, stageperfomance.getSeatOfS());
			psmt.setInt(4, stageperfomance.getSeatOfA());

			int check = psmt.executeUpdate();

			if(check == 1) return true;
			else return false;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {if(psmt!=null) psmt.close();} catch(Exception e) {}
			try {if(conn!=null) conn.close();} catch(Exception e) {}
		}

		return false;
	}

	// 공연장 삭제
	public boolean deleteStagePerformance(String place) {
		connect();
		try {
			String sql = "delete from performance_stage where place = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, place);
			int check = psmt.executeUpdate();

			if(check == 1) return true;
			else return false;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {if(psmt!=null) psmt.close();} catch(Exception e) {}
			try {if(conn!=null) conn.close();} catch(Exception e) {}
		}
		return false;
	}

	// 공연장 - 장소 수정
	public boolean updatePlace(String place, String originalPlace) {
		connect();
		try {
			String sql = "update performance_stage set place = ? where place = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, place);
			psmt.setString(2, originalPlace);
			int check = psmt.executeUpdate();

			if(check == 1) return true;
			else return false;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {if(psmt!=null) psmt.close();} catch(Exception e) {}
			try {if(conn!=null) conn.close();} catch(Exception e) {}
		}
		return false;
	}

	// 공연장 - R석 좌석수 수정
	public boolean updateSeatOfR(int seatOfR, String place) {
		connect();
		try {
			String sql = "update performance_stage set seatOfR = ? where place = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seatOfR);
			psmt.setString(2, place);
			int check = psmt.executeUpdate();

			if(check == 1) return true;
			else return false;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {if(psmt!=null) psmt.close();} catch(Exception e) {}
			try {if(conn!=null) conn.close();} catch(Exception e) {}
		}
		return false;
	}	

	// 공연장 - S석 좌석수 수정
	public boolean updateSeatOfS(int seatOfS, String place) {
		connect();
		try {
			String sql = "update performance_stage set seatOfS = ? where place = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seatOfS);
			psmt.setString(2, place);
			int check = psmt.executeUpdate();

			if(check == 1) return true;
			else return false;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {if(psmt!=null) psmt.close();} catch(Exception e) {}
			try {if(conn!=null) conn.close();} catch(Exception e) {}
		}
		return false;
	}

	// 공연장 - A석 좌석수 수정
	public boolean updateSeatOfA(int seatOfA, String place) {
		connect();
		try {
			String sql = "update performance_stage set seatOfA = ? where place = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seatOfA);
			psmt.setString(2, place);
			int check = psmt.executeUpdate();

			if(check == 1) return true;
			else return false;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {if(psmt!=null) psmt.close();} catch(Exception e) {}
			try {if(conn!=null) conn.close();} catch(Exception e) {}
		}
		return false;
	}
	
	public Vector<int[]> reseveSeats(int[] info, String dd) {
		connect();
		try {
			String sql = "select seat from ticketing where pno = ? and tdate = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, info[0]);
			psmt.setString(2, dd);
			rs = psmt.executeQuery();

			int[] r = new int[info[1]];
			int[] s = new int[info[2]];
			int[] a = new int[info[3]];

			char[] rsa = {'R', 'S', 'A'};

			while(rs.next()) {
				for(int i = 0; i < rsa.length; i++) {
					for(int j = 0; j < info[i+1]; j++) {
						if(rs.getString("seat").charAt(0) == rsa[i] 
								&& Integer.parseInt(rs.getString("seat").substring(1, rs.getString("seat").length()))-1 == j
								&& i == 0) {
							r[j] = 1;
						}
						else if(rs.getString("seat").charAt(0) == rsa[i] 
								&& Integer.parseInt(rs.getString("seat").substring(1, rs.getString("seat").length()))-1 == j
								&& i == 1) {
							s[j] = 1;
						}
						else if(rs.getString("seat").charAt(0) == rsa[i] 
								&& Integer.parseInt(rs.getString("seat").substring(1, rs.getString("seat").length()))-1 == j
								&& i == 2) {
							a[j] = 1;
						}
					}
				}
			}
			
			Vector<int[]> reserve = new Vector<int[]>();
			
			reserve.add(r);
			reserve.add(s);
			reserve.add(a);
			
			return reserve;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {if(rs!=null) rs.close();}catch(Exception e){}
			try {if(psmt!=null) psmt.close();} catch(Exception e) {}
			try {if(conn!=null) conn.close();} catch(Exception e) {}
		}
		return null;
	}

	
	public int printSeat(int[] info) {
		connect();
		try {
			String sql = "select seat from ticketing where pno = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, info[0]);
			rs = psmt.executeQuery();

			int[] r = new int[info[1]];
			int[] s = new int[info[2]];
			int[] a = new int[info[3]];

			int maxLength = 0;
			if(r.length > s.length)
				maxLength = r.length;
			else maxLength = s.length;
			if(maxLength < a.length)
				maxLength = a.length;

			char[] rsa = {'R', 'S', 'A'};

			while(rs.next()) {
				for(int i = 0; i < rsa.length; i++) {
					for(int j = 0; j < info[i+1]; j++) {
						if(rs.getString("seat").charAt(0) == rsa[i] 
								&& Integer.parseInt(rs.getString("seat").substring(1, rs.getString("seat").length()))-1 == j
								&& i == 0) {
							r[j] = 1;
						}
						else if(rs.getString("seat").charAt(0) == rsa[i] 
								&& Integer.parseInt(rs.getString("seat").substring(1, rs.getString("seat").length()))-1 == j
								&& i == 1) {
							s[j] = 1;
						}
						else if(rs.getString("seat").charAt(0) == rsa[i] 
								&& Integer.parseInt(rs.getString("seat").substring(1, rs.getString("seat").length()))-1 == j
								&& i == 2) {
							a[j] = 1;
						}
					}
				}
			}

			System.out.println("***************좌석 ***************");
			System.out.println("*        왼쪽부터   1열 입니다\t\t*");
			for(int i = 0; i < rsa.length; i++) {
				if(i == 0) {
					System.out.print("* R 석 ");
					for(int k = 0; k < maxLength-r.length; k++)
						System.out.print("  ");
				}
				else if(i== 1) {
					System.out.print("* S 석 ");
					for(int k = 0; k < maxLength-s.length; k++)
						System.out.print("  ");
				}
				else if(i ==2) {
					System.out.print("* A 석 ");
					for(int k = 0; k < maxLength-a.length; k++)
						System.out.print("  ");
				}



				for(int j = 0; j < info[i+1]; j++) {
					if(i == 0 && r[j] == 1) {
						System.out.print("■ ");
					}
					else if (i == 1 && s[j] == 1) {
						System.out.print("■ ");
					}
					else if (i == 2 && a[j] == 1) {
						System.out.print("■ ");
					}
					else
						System.out.print("□ ");
				}
				System.out.println("");
			}
			return info[0];
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {if(rs!=null) rs.close();}catch(Exception e){}
			try {if(psmt!=null) psmt.close();} catch(Exception e) {}
			try {if(conn!=null) conn.close();} catch(Exception e) {}
		}
		return 0;
	}




	///////////////////////////사용
	// 개시 공연 등록(추가)
	public boolean openPerformanceAdd(OpenPerformanceDTO openperfomance) {
		connect();
		try {
			String sql = "insert into open_performance values(0,?,?,?,?,?,?,?,?,?,?);";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, openperfomance.getName());
			psmt.setString(2, openperfomance.getPlace());
			psmt.setString(3, openperfomance.getSdate());
			psmt.setString(4, openperfomance.getEdate());
			psmt.setString(5, openperfomance.getStime());
			psmt.setInt(6, openperfomance.getPriceSeatR());
			psmt.setInt(7, openperfomance.getPriceSeatS());
			psmt.setInt(8, openperfomance.getPriceSeatA());
			psmt.setString(9, openperfomance.getId());
			psmt.setInt(10, openperfomance.getOpened());
			int check = psmt.executeUpdate();

			if(check == 1) return true;
			else return false;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {if(psmt!=null) psmt.close();} catch(Exception e) {}
			try {if(conn!=null) conn.close();} catch(Exception e) {}
		}

		return false;
	}

	// 전체 공연장 조회
	public Vector<StagePerformanceDTO> totalInquiryStagePerformance() {
		connect();
		Vector<StagePerformanceDTO> spfList = new Vector<StagePerformanceDTO>();
		StagePerformanceDTO spf;
		try {

			String sql = "select * from performance_stage";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while(rs.next()) {
				spf = new StagePerformanceDTO();
				spf.setPlace(rs.getString("place"));
				spf.setSeatOfR(rs.getInt("seatOfR"));
				spf.setSeatOfS(rs.getInt("seatOfS"));
				spf.setSeatOfA(rs.getInt("seatOfA"));
				spfList.addElement(spf);
			}
			return spfList;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {if(rs!=null) rs.close();}catch(Exception e){}
			try {if(psmt!=null) psmt.close();} catch(Exception e) {}
			try {if(conn!=null) conn.close();} catch(Exception e) {}
		}
		return null;
	}
	//id로 관리자의 모든 공연 조회
	public Vector<PerformanceDTO> adminInquiryPerformanceById(String id) {	
		connect();
		Vector<PerformanceDTO> pfList = new Vector<PerformanceDTO>();
		PerformanceDTO pf;
		try {
			String sql = "select * from performance where id = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();

			while(rs.next()) {
				pf = new PerformanceDTO(); 
				pf.setName(rs.getString("name"));
				pf.setType(rs.getString("type"));
				pf.setTime(rs.getInt("time"));
				pf.setId(rs.getString("id"));	
				pfList.addElement(pf);
			}
			return pfList;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {if(rs!=null) rs.close();} catch(Exception e) {}
			try {if(psmt!=null) psmt.close();} catch(Exception e) {}
			try {if(conn!=null) conn.close();} catch(Exception e) {}
		}
		return null;
	}

	//id로 개시공연 조회
	public Vector<OpenPerformanceDTO> adminInquiryOpenPerformanceById(String id) {	
		connect();
		Vector<OpenPerformanceDTO> opfList = new Vector<OpenPerformanceDTO>();
		OpenPerformanceDTO opf;
		try {
			String sql = "select * from open_performance where id = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();

			while(rs.next()) {
				opf = new OpenPerformanceDTO();
				opf.setPno(rs.getInt("pno"));
				opf.setName(rs.getString("name"));
				opf.setPlace(rs.getString("place"));
				opf.setSdate(rs.getString("sdate"));
				opf.setEdate(rs.getString("edate"));
				opf.setStime(rs.getString("stime"));
				opf.setPriceSeatR(rs.getInt("priceSeatR"));
				opf.setPriceSeatS(rs.getInt("priceSeatS"));
				opf.setPriceSeatA(rs.getInt("priceSeatA"));
				opf.setId(rs.getString("id"));	
				opf.setOpened(rs.getInt("opened"));	

				opfList.addElement(opf);
			}
			return opfList;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {if(rs!=null) rs.close();} catch(Exception e) {}
			try {if(psmt!=null) psmt.close();} catch(Exception e) {}
			try {if(conn!=null) conn.close();} catch(Exception e) {}
		}
		return null;
	}

	// 공연 이름 중복 체크
	public boolean checkName(String name) {	//name의 중복체크
		connect();
		try {
			String sql = "select * from performance where name = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, name);
			rs = psmt.executeQuery();

			return rs.next();	//중복일 경우 true반환

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {if(rs!=null) rs.close();} catch(Exception e) {}
			try {if(psmt!=null) psmt.close();} catch(Exception e) {}
			try {if(conn!=null) conn.close();} catch(Exception e) {}
		}
		return false;//중복이지 않을 경우 false반환
	}
	// 개시 공연 존재 여부 체크
	public boolean checkNum(int num) {	//pno의 중복체크
		connect();
		try {
			String sql = "select * from open_performance where pno = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, num);
			rs = psmt.executeQuery();

			return rs.next();	//중복일 경우 true반환

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {if(rs!=null) rs.close();} catch(Exception e) {}
			try {if(psmt!=null) psmt.close();} catch(Exception e) {}
			try {if(conn!=null) conn.close();} catch(Exception e) {}
		}
		return false;//중복이지 않을 경우 false반환
	}
	// 개시 공연 존재 여부 체크
	public boolean checkPName(String name) {	//pno의 중복체크
		connect();
		try {
			String sql = "select * from open_performance where name = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, name);
			rs = psmt.executeQuery();

			return rs.next();	//중복일 경우 true반환

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {if(rs!=null) rs.close();} catch(Exception e) {}
			try {if(psmt!=null) psmt.close();} catch(Exception e) {}
			try {if(conn!=null) conn.close();} catch(Exception e) {}
		}
		return false;//중복이지 않을 경우 false반환
	}

	// 개시 안된 공연 추가
	public boolean performanceAdd(PerformanceDTO performance) {
		connect();
		try {
			String sql = "insert into performance values(?,?,?,?);";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, performance.getName());
			psmt.setString(2, performance.getType());
			psmt.setInt(3, performance.getTime());
			psmt.setString(4, performance.getId());
			int check = psmt.executeUpdate();

			if(check == 1) return true;
			else return false;
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			try {if(psmt!=null) psmt.close();} catch(Exception e) {}
			try {if(conn!=null) conn.close();} catch(Exception e) {}
		}

		return false;
	}
	public int[] getSeats(int pno) {
		connect();
		int[] info = new int[4];
		StringBuffer sql = new StringBuffer("select pno,seatOfR,seatOfS,seatOfA from open_performance join performance_stage");
		sql.append(" on open_performance.place = performance_stage.place");
		sql.append(" where pno = ?");
		try {
			psmt = conn.prepareStatement(sql.toString());
			psmt.setInt(1,pno);

			rs = psmt.executeQuery();
			rs.next();
			info[0] = rs.getInt("pno");
			info[1] = rs.getInt("seatOfR");
			info[2] = rs.getInt("seatOfS");
			info[3] = rs.getInt("seatOfA");
			return info;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return info;
	}
	// pno를 통한 조회
	public OpenPerformanceDTO memberInquiryOpenPerformance(int pno) {
		connect();
		OpenPerformanceDTO opf = new OpenPerformanceDTO();
		try {
			String sql = "select * from open_performance where pno = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, pno);
			rs = psmt.executeQuery();

			rs.next();
			opf.setPno(rs.getInt("pno"));
			opf.setName(rs.getString("name"));
			opf.setPlace(rs.getString("place"));
			opf.setSdate(rs.getString("sdate"));
			opf.setEdate(rs.getString("edate"));
			opf.setStime(rs.getString("stime"));
			opf.setPriceSeatR(rs.getInt("priceSeatR"));
			opf.setPriceSeatS(rs.getInt("priceSeatS"));
			opf.setPriceSeatA(rs.getInt("priceSeatA"));
			opf.setId(rs.getString("id"));
			opf.setOpened(rs.getInt("opened"));
			
			return opf;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {if(psmt!=null) psmt.close();} catch(Exception e) {}
			try {if(conn!=null) conn.close();} catch(Exception e) {}
		}
		return null;
	}
	//관리자 공연조회
	public Vector<Integer> adminInquiryPno(String id) { // id로 공연 번호만 조회
		connect();
		OpenPerformanceDTO opf;
		Vector<Integer> pnoList = new Vector<Integer>();
		try {
			String sql = "select pno from open_performance where id = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();

			while (rs.next()) {
				opf = new OpenPerformanceDTO();
				pnoList.addElement(rs.getInt("pno"));
			}

			return pnoList;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {if (rs != null)rs.close();} catch (Exception e) {}
			try {if(psmt!=null) psmt.close();} catch(Exception e) {}
			try {if(conn!=null) conn.close();} catch(Exception e) {}
		}
		return null;
	}
	public boolean openPerformPublish(int pno) {
		connect();
		try {
			String sql = "update open_performance set opened = 1 where pno = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1,pno);

			if(psmt.executeUpdate() ==1) return true;
			else return false;
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {if(psmt!=null) psmt.close();} catch(Exception e) {}
			try {if(conn!=null) conn.close();} catch(Exception e) {}
		}
		return false;

	}

	public Vector<OpenPerformanceDTO> totalInquiryOpenPerformanceOpened() {
		connect();
		Vector<OpenPerformanceDTO> opfList = new Vector<OpenPerformanceDTO>();
		OpenPerformanceDTO opf;
		try {

			String sql = "select * from open_performance where opened = 1";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while(rs.next()) {
				opf = new OpenPerformanceDTO();
				opf.setPno(rs.getInt("pno"));
				opf.setName(rs.getString("name"));
				opf.setPlace(rs.getString("place"));
				opf.setSdate(rs.getString("sdate"));
				opf.setEdate(rs.getString("edate"));
				opf.setStime(rs.getString("stime"));
				opf.setPriceSeatR(rs.getInt("priceSeatR"));
				opf.setPriceSeatS(rs.getInt("priceSeatS"));
				opf.setPriceSeatA(rs.getInt("priceSeatA"));
				opf.setId(rs.getString("id"));
				opf.setOpened(rs.getInt("opened"));

				opfList.addElement(opf);
			}
			return opfList;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {if(rs!=null) rs.close();}catch(Exception e){}
			try {if(psmt!=null) psmt.close();} catch(Exception e) {}
			try {if(conn!=null) conn.close();} catch(Exception e) {}
		}
		return null;
	}


	// 애트리뷰트의 타이틀을 가져옴
	public Vector<String> getMemberTitleById(String id) {
		Vector<String> memberTitles = new Vector<String>();
		connect();
		try {
			String sql = "select * from open_performance where id = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);

			rs = psmt.executeQuery();
			ResultSetMetaData  rsm = rs.getMetaData();        

			int cnt = rsm.getColumnCount();

			while(rs.next()) { 
				for (int i=2; i<=cnt-1; i++) {
					String title = rsm.getColumnLabel(i);   // 애트리뷰트의 타이틀을 가져옴
					Object obj = rs.getObject(i);
					memberTitles.addElement(title);
				} 
			}

		} catch (SQLException e) {
			System.out.println(" !! PerformanceDAO.getMemberTitle() error!");
			e.printStackTrace();

		} finally {
			try {if(rs!=null) rs.close();} catch(Exception e) {}
			try {if(psmt!=null) psmt.close();} catch(Exception e) {}
			try {if(conn!=null) conn.close();} catch(Exception e) {}
		}
		return memberTitles;
	}

	//애트리뷰트 제목 값을 받아서 수정1 - String
	public boolean updateTitleById1(int id, String title, String content) { 
		connect();
		try {      
			String sql = "update open_performance set "+ title + " = "
					+ "'"+content+"'" + " where pno = " + id;
			stmt = conn.createStatement();

			int check = stmt.executeUpdate(sql);

			if(check == 1) return true;
			else return false;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {if(rs!=null) rs.close();} catch(Exception e) {}
			try {if(psmt!=null) psmt.close();} catch(Exception e) {}
			try {if(conn!=null) conn.close();} catch(Exception e) {}
		}
		return false;
	}
	//애트리뷰트 제목 값을 받아서 수정2 - int
	public boolean updateTitleById2(int id, String title, String content) { 
		connect();
		try {      
			String sql = "update open_performance set "+ title + " = "
					+content + " where pno = " + id;
			stmt = conn.createStatement();

			int check = stmt.executeUpdate(sql);

			if(check == 1) return true;
			else return false;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {if(rs!=null) rs.close();} catch(Exception e) {}
			try {if(psmt!=null) psmt.close();} catch(Exception e) {}
			try {if(conn!=null) conn.close();} catch(Exception e) {}
		}
		return false;
	}

	//id로 개시공연 조회
	public Vector<OpenPerformanceDTO> adminInquiryOpenPerformanceByOpened(String id) {	
		connect();
		Vector<OpenPerformanceDTO> opfList = new Vector<OpenPerformanceDTO>();
		OpenPerformanceDTO opf;
		try {
			String sql = "select * from open_performance where id = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();

			while(rs.next()) {
				opf = new OpenPerformanceDTO();
				opf.setPno(rs.getInt("pno"));
				opf.setName(rs.getString("name"));
				opf.setPlace(rs.getString("place"));
				opf.setSdate(rs.getString("sdate"));
				opf.setEdate(rs.getString("edate"));
				opf.setStime(rs.getString("stime"));
				opf.setPriceSeatR(rs.getInt("priceSeatR"));
				opf.setPriceSeatS(rs.getInt("priceSeatS"));
				opf.setPriceSeatA(rs.getInt("priceSeatA"));
				opf.setId(rs.getString("id"));			

				opfList.addElement(opf);
			}
			return opfList;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {if(rs!=null) rs.close();} catch(Exception e) {}
			try {if(psmt!=null) psmt.close();} catch(Exception e) {}
			try {if(conn!=null) conn.close();} catch(Exception e) {}
		}
		return null;
	}

	public int priceOfSeatR(int pno) {
		connect();
		try {
			String sql = "select priceSeatR from open_performance where pno = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, pno);

			rs = psmt.executeQuery();
			rs.next();
			return rs.getInt("priceSeatR");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {if(rs!=null) rs.close();} catch(Exception e) {}
			try {if(psmt!=null) psmt.close();} catch(Exception e) {}
			try {if(conn!=null) conn.close();} catch(Exception e) {}
		}

		return 0;
	}

	public int priceOfSeatS(int pno) {
		connect();
		try {
			String sql = "select priceSeatS from open_performance where pno = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, pno);

			rs = psmt.executeQuery();
			rs.next();
			return rs.getInt("priceSeatS");
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {if(rs!=null) rs.close();} catch(Exception e) {}
			try {if(psmt!=null) psmt.close();} catch(Exception e) {}
			try {if(conn!=null) conn.close();} catch(Exception e) {}
		}

		return 0;
	}

	public int priceOfSeatA(int pno) {
		connect();
		try {
			String sql = "select priceSeatA from open_performance where pno = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, pno);

			rs = psmt.executeQuery();
			rs.next();
			return rs.getInt("priceSeatA");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {if(rs!=null) rs.close();} catch(Exception e) {}
			try {if(psmt!=null) psmt.close();} catch(Exception e) {}
			try {if(conn!=null) conn.close();} catch(Exception e) {}
		}

		return 0;
	}
	
	//Opened로 개시공연 조회(1)
		public Vector<OpenPerformanceDTO> adminInquiryOpenPerformanceByOpened() {	
			connect();
			Vector<OpenPerformanceDTO> opfList = new Vector<OpenPerformanceDTO>();
			OpenPerformanceDTO opf;
			try {
				String sql = "select * from open_performance where opened = 1";
				psmt = conn.prepareStatement(sql);
				rs = psmt.executeQuery();

				while(rs.next()) {
					opf = new OpenPerformanceDTO();
					opf.setPno(rs.getInt("pno"));
					opf.setName(rs.getString("name"));
					opf.setPlace(rs.getString("place"));
					opf.setSdate(rs.getString("sdate"));
					opf.setEdate(rs.getString("edate"));
					opf.setStime(rs.getString("stime"));
					opf.setPriceSeatR(rs.getInt("priceSeatR"));
					opf.setPriceSeatS(rs.getInt("priceSeatS"));
					opf.setPriceSeatA(rs.getInt("priceSeatA"));
					opf.setId(rs.getString("id"));	
					opf.setOpened(rs.getInt("opened"));	

					opfList.addElement(opf);
				}
				return opfList;

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {if(rs!=null) rs.close();} catch(Exception e) {}
				try {if(psmt!=null) psmt.close();} catch(Exception e) {}
				try {if(conn!=null) conn.close();} catch(Exception e) {}
			}
			return null;
		}
		
		//Opened로 개시공연 조회(2)
		public Vector<OpenPerformanceDTO> adminInquiryOpenPerformanceByClosed() {	
			connect();
			Vector<OpenPerformanceDTO> opfList = new Vector<OpenPerformanceDTO>();
			OpenPerformanceDTO opf;
			try {
				String sql = "select * from open_performance where opened = 0";
				psmt = conn.prepareStatement(sql);
				rs = psmt.executeQuery();

				while(rs.next()) {
					opf = new OpenPerformanceDTO();
					opf.setPno(rs.getInt("pno"));
					opf.setName(rs.getString("name"));
					opf.setPlace(rs.getString("place"));
					opf.setSdate(rs.getString("sdate"));
					opf.setEdate(rs.getString("edate"));
					opf.setStime(rs.getString("stime"));
					opf.setPriceSeatR(rs.getInt("priceSeatR"));
					opf.setPriceSeatS(rs.getInt("priceSeatS"));
					opf.setPriceSeatA(rs.getInt("priceSeatA"));
					opf.setId(rs.getString("id"));	
					opf.setOpened(rs.getInt("opened"));	

					opfList.addElement(opf);
				}
				return opfList;

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {if(rs!=null) rs.close();} catch(Exception e) {}
				try {if(psmt!=null) psmt.close();} catch(Exception e) {}
				try {if(conn!=null) conn.close();} catch(Exception e) {}
			}
			return null;
		}
}

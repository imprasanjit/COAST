package com.coast.app.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coast.app.customRepository.BaleshwarAquapondRepositoryCustom;
import com.coast.app.customRepository.BaleshwarLeadPlotsRepoCustom;
import com.coast.app.entity.Baleshwar_Aquaponds;
import com.coast.app.entity.Baleshwar_Feasible_Land;
import com.coast.app.entity.Baleshwar_Leas_Plots;
import com.coast.app.entity.User_Details;
import com.coast.app.repository.BalasoreAquaPondRepo;
import com.coast.app.repository.BaleswarFeasibleLandRepo;
import com.coast.app.repository.BaleswarLeasPlotsRepo;
import com.coast.app.service.BaleshwarLeadPlotsService;

@Service
public class BaleshwarLeadPlotsServiceImpl implements BaleshwarLeadPlotsService {

	
	  @Autowired 
	  private BaleswarLeasPlotsRepo baleswarLeasPlotsRepo;
	
	
	/*
	 * @Autowired private BaleshwarLeadPlotsRepoCustom baleswarLeasPlotsRepo;
	 */
	
	@Autowired
	private BaleswarFeasibleLandRepo baleswarFeasibleLandRepo;

	@Autowired
	private BalasoreAquaPondRepo balasoreAquaPondRepo;
	@Autowired
	private BaleshwarAquapondRepositoryCustom baleshwarAquapondRepositoryCustom;

	@Override
	public List<Baleshwar_Feasible_Land> getAllFesLanddetails(String dist, String tehsil, String gp, String village,String query) 
	{
		List<Baleshwar_Feasible_Land> allFesLanddetails = null;
		if (!dist.equalsIgnoreCase("ALL")) {
			if (!tehsil.equalsIgnoreCase("ALL")) {
				if (!gp.equalsIgnoreCase("ALL")) {
					if (!village.equalsIgnoreCase("ALL")) {
						if (!query.equalsIgnoreCase("ALL")) {
							allFesLanddetails = baleswarFeasibleLandRepo.getAllFesLanddetails(dist, tehsil, gp, village,
									query);

						} else {
							allFesLanddetails = baleswarFeasibleLandRepo.getAllFesLanddetailsAll(dist, tehsil, gp, village,
									query);

						}
					} else {
						if (!query.equalsIgnoreCase("ALL")) {
							allFesLanddetails = baleswarFeasibleLandRepo.getAllFesLanddetails(dist, tehsil, gp, query);

						} else {
							allFesLanddetails = baleswarFeasibleLandRepo.getAllFesLanddetailsAll(dist, tehsil, gp, query);

						}

					}

				} else {
					if (!query.equalsIgnoreCase("ALL")) {
						allFesLanddetails = baleswarFeasibleLandRepo.getAllFesLanddetails(dist, tehsil, query);

					} else {
						allFesLanddetails = baleswarFeasibleLandRepo.getAllFesLanddetailsAll(dist, tehsil, query);

					}
				}
			} else {
				if (!query.equalsIgnoreCase("ALL")) {
					allFesLanddetails = baleswarFeasibleLandRepo.getAllFesLanddetails(dist, query);

				} else {
					allFesLanddetails = baleswarFeasibleLandRepo.getAllFesLanddetailsAll(dist, query);

				}
			}
		}
		return allFesLanddetails;
	}

	@Override
	public List<Baleshwar_Aquaponds> getAquapond(String dist, String tehsil, String gp, String village, String query) {
		List<Baleshwar_Aquaponds> aquapondDetails = null;
		if (dist.equals("Khurda")) 
		{
			dist="Khurdha";
		}
		if (!dist.equalsIgnoreCase("ALL")) {
			if (!tehsil.equalsIgnoreCase("ALL")) {
				if (!gp.equalsIgnoreCase("ALL")) {
					if (!village.equalsIgnoreCase("ALL")) {
						if (!query.equalsIgnoreCase("ALL")) {
							aquapondDetails = baleshwarAquapondRepositoryCustom.getAquapondDetails(dist, tehsil, gp, village, query);
							} else {
							aquapondDetails = baleshwarAquapondRepositoryCustom.getAquapondDetails(dist, tehsil, gp, village, query);

						}
					} else {
						if (!query.equalsIgnoreCase("ALL")) {
							aquapondDetails = baleshwarAquapondRepositoryCustom.getAquapondDetails(dist, tehsil, gp, query);

						} else {
							aquapondDetails = baleshwarAquapondRepositoryCustom.getAquapondDetails(dist, tehsil, gp, query);

						}

					}

				} else {
					if (!query.equalsIgnoreCase("ALL")) {
						aquapondDetails = baleshwarAquapondRepositoryCustom.getAquapondDetails(dist, tehsil, query);

					} else {
						aquapondDetails = baleshwarAquapondRepositoryCustom.getAquapondDetails(dist, tehsil, query);

					}
				}
			} else {
				if (!query.equalsIgnoreCase("ALL")) {
					aquapondDetails = baleshwarAquapondRepositoryCustom.getAquapondDetails(dist, query);

				} else {
					aquapondDetails = baleshwarAquapondRepositoryCustom.getAquapondDetails(dist, query);

				}
			}
		}
		return aquapondDetails;
	}

	@Override
	public List<Baleshwar_Leas_Plots> getRegFarm(String dist, String tehsil, String gp, String village, String query) {
		List<Baleshwar_Leas_Plots> regFarm = null;
		if (!dist.equalsIgnoreCase("ALL")) {
			if (!tehsil.equalsIgnoreCase("ALL")) {
				if (!gp.equalsIgnoreCase("ALL")) {
					if (!village.equalsIgnoreCase("ALL")) {
						if (!query.equals("ALL")) {
							regFarm = baleswarLeasPlotsRepo.getRegFarm(dist, tehsil, gp, village, query);

						} else {
							regFarm = baleswarLeasPlotsRepo.getRegFarm(dist, tehsil, gp, village, query);

						}
					} else {
						if (!query.equalsIgnoreCase("all")) {
							regFarm = baleswarLeasPlotsRepo.getRegFarm(dist, tehsil, gp, query);

						} else {
							regFarm = baleswarLeasPlotsRepo.getRegFarm(dist, tehsil, gp, query);

						}

					}

				} else {
					if (!query.equalsIgnoreCase("ALL")) {
						regFarm = baleswarLeasPlotsRepo.getRegFarm(dist, tehsil, query);

					} else {
						regFarm = baleswarLeasPlotsRepo.getRegFarm(dist, tehsil, query);

					}
				}
			} else {
				if (!query.equalsIgnoreCase("ALL")) {
					regFarm = baleswarLeasPlotsRepo.getRegFarm(dist, query);

				} else {
					regFarm = baleswarLeasPlotsRepo.getRegFarm(dist, query);

				}
			}
		}
		return regFarm;
	}

	@Override
	public List<User_Details> getAllUser() {
		// TODO Auto-generated method stub
		return baleswarLeasPlotsRepo.getAllUser();
	}

}
